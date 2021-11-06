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

local function openTelescopeAt(dir)
  require'telescope.builtin'.find_files({ cwd = dir, hidden = true })
end

local function getRoot()
  return execute([[ 
    git_dir=$(git rev-parse --show-toplevel 2>/dev/null);
    if [ $? -eq 0 ]; then
      echo $git_dir
    else
      echo $PWD
    fi
  ]])
end

function _M.telescope_find_files_in_root()
  openTelescopeAt(getRoot())
end

function _M.telescope_find_files_in_dir(dir)
  local git_root = getRoot()
  local root = git_root .. dir

  if exists(root) then
    openTelescopeAt(root)
  else
    print('NO SUCH FOLDER: ' .. dir)
  end
end

function _M.telescope_open_dotfiles()
  local home_dir = execute('echo $HOME')
  local dotfiles_dir = home_dir .. "/dotfiles"

  if exists(dotfiles_dir) then
    openTelescopeAt(dotfiles_dir)
  else
    print('NO SUCH FOLDER: ' .. dotfiles_dir)
  end
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
        file_ignore_patterns = { "%.git", "node%_modules" }
      },
    })

  map('n', '<space>s', ':lua _M.telescope_find_files_in_root()<cr>', { silent = true, noremap = true })
  map('n', ',<space>s', ':lua _M.telescope_find_files_in_dir(\'/src\')<cr>', { silent = true, noremap = true })
  map('n', ',<space>t', ':lua _M.telescope_find_files_in_dir(\'/testcafe\')<cr>', { silent = true, noremap = true })
  map('n', ',<space>a', ':lua _M.telescope_find_files_in_dir(\'/api-mock\')<cr>', { silent = true, noremap = true })

  map('n', '\\d', ':lua _M.telescope_open_dotfiles()<cr>', { silent = true, noremap = true })

  map('n', '<leader>l', ':Telescope current_buffer_fuzzy_find<cr>', { silent = true, noremap = true })
  map('n', '\\h', ':Telescope help_tags<cr>', { silent = true, noremap = true })
  map('n', '\\r', ':Telescope lsp_references<cr>', { silent = true, noremap = true })
  map('n', '\\a', ':Telescope lsp_code_actions<cr>', { silent = true, noremap = true })
  map('n', '\\c', ':Telescope commands<cr>', { silent = true, noremap = true })
end

return telescope_config
