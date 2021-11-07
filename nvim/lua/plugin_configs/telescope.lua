local map = vim.api.nvim_set_keymap

local function exists(file)
  local ok, _, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      return true
    end
  end
  return ok
end

local function execute(command)
  local handler = io.popen(command)
  local response = handler:read('*a'):sub(1, -2)
  handler:close()

  return response
end

local function openFindFilesAt(dir)
  require'telescope.builtin'.find_files({ cwd = dir, hidden = true })
end

local function getRoot()
  local file_dir = vim.fn.expand('%:p:h')
  print('file_dir ' .. file_dir)
  return execute([[ 
    git_dir=$(git -C ]] .. file_dir .. [[ rev-parse --show-toplevel 2>/dev/null);
    if [ $? -eq 0 ]; then
      echo $git_dir
    else
      echo $PWD
    fi
  ]])
end

function _M.telescope_find_files_in_root()
  openFindFilesAt(getRoot())
end

function _M.telescope_find_files_in_dir(dir)
  local git_root = getRoot()
  local root = git_root .. dir

  if exists(root) then
    openFindFilesAt(root)
  else
    print('NO SUCH FOLDER: ' .. dir)
  end
end

function _M.telescope_open_dotfiles()
  local home_dir = execute('echo $HOME')
  local dotfiles_dir = home_dir .. "/dotfiles"

  if exists(dotfiles_dir) then
    openFindFilesAt(dotfiles_dir)
  else
    print('NO SUCH FOLDER: ' .. dotfiles_dir)
  end
end

function _M.telescope_live_grep()
  require'telescope.builtin'.live_grep{ cwd = getRoot() }
end

local telescope_config = function()
  require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require('telescope.actions').close,
          },
        },
        layout_config = {
          horizontal = {
            prompt_position = "bottom"
          }
        },
        file_ignore_patterns = { "%.git", "node%_modules" },
      },
    })

  local opts = { silent = true, noremap = true }

  map('n', '<space>s', '<cmd>lua _M.telescope_find_files_in_root()<cr>', opts)
  map('n', ',<space>s', '<cmd>lua _M.telescope_find_files_in_dir(\'/src\')<cr>', opts)
  map('n', ',<space>t', '<cmd>lua _M.telescope_find_files_in_dir(\'/testcafe\')<cr>', opts)
  map('n', ',<space>a', '<cmd>lua _M.telescope_find_files_in_dir(\'/api-mock\')<cr>', opts)
  map('n', '<space>g', '<cmd>lua _M.telescope_live_grep()<cr>', opts)
  map('n', '<space>b', '<cmd>lua require"telescope.builtin".buffers()<cr>', opts)
  map('n', '<space>l', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find()<cr>', opts)
  map('n', '\\r', '<cmd>lua require"telescope.builtin".resume()<cr>', opts)
  map('n', '\\s', '<cmd>lua require"telescope.builtin".git_status({ cwd = "' .. getRoot() .. '" })<cr>', opts)
  map('n', '\\d', '<cmd>lua require"telescope.builtin".lsp_workspace_diagnostics()<cr>', opts)
  map('n', '\\c', '<cmd>lua require"telescope.builtin".commands()<cr>', opts)
  map('n', '\\\\h', '<cmd>lua require"telescope.builtin".help_tags()<cr>', opts)

  map('n', '\\\\d', '<cmd>lua _M.telescope_open_dotfiles()<cr>', opts)
  map('n', '\\\\b', '<cmd>lua require"telescope.builtin".builtin()<cr>', opts)

  map('n', '\\a', ':Telescope lsp_code_actions<cr>', opts)
end

return telescope_config
