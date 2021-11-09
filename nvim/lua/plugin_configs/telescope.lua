local u = R'utils'
local map = vim.api.nvim_set_keymap

local function showNoSuchFolder(dir)
  print('NO SUCH FOLDER: ' .. u.trimPath(dir, 2))
end

local function find_files(dir)
  if u.exists(dir) then
    require'telescope.builtin'.find_files({ cwd = dir, hidden = true, prompt_title = u.trimPath(dir, 2) })
  else
    showNoSuchFolder(dir)
  end
end

local function live_grep(dir)
  if u.exists(dir) then
    require'telescope.builtin'.live_grep{ cwd = dir, prompt_title = 'GREP: ' .. u.trimPath(dir, 2) }
  else
    showNoSuchFolder(dir)
  end
end

function _M.find_files_in_file_dir(dir) find_files( u.getFileDir() .. (dir or '') ) end
function _M.find_files_in_root_dir(dir) find_files( u.getRoot() .. (dir or '') ) end
function _M.find_files_in_home_dir(dir) find_files( u.getHome() .. (dir or '') ) end
function _M.find_files_in_current_dir(dir) find_files( u.getCwd() .. (dir or '') ) end

function _M.find_files_in_up_root_dir(i) 
  local root = u.getRoot();
  local proj_rel_path = u.getProjectFilePath(root, u.getFileDir())
  local _, trimmed = u.trimPath(proj_rel_path, i)
  local target_path = root .. '/' .. trimmed 
  find_files(target_path) 
end

function _M.live_grep_in_file_dir(dir) live_grep( u.getFileDir() .. (dir or '') ) end
function _M.live_grep_in_root_dir(dir) live_grep( u.getRoot() .. (dir or '') ) end
function _M.live_grep_in_home_dir(dir) live_grep( u.getHome() .. (dir or '') ) end
function _M.live_grep_in_current_dir(dir) live_grep( u.getCwd() .. (dir or '') ) end

function _M.live_grep_in_up_root_dir(i) 
  local root = u.getRoot();
  local proj_rel_path = u.getProjectFilePath(root, u.getFileDir())
  local _, trimmed = u.trimPath(proj_rel_path, i)
  local target_path = root .. '/' .. trimmed 
  live_grep(target_path) 
end

function _M.git_status_in_file_dir(dir) 
  require'telescope.builtin'.git_status({ cwd = u.getFileDir() })
end

local telescope_config = function()
  local actions = require('telescope.actions')
  require('telescope').setup({
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",

        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },

        layout_config = {
          width = 0.95,
          height = 0.95,
          preview_width = 0.5,
          preview_cutoff = 100,
          horizontal = {
            prompt_position = "bottom"
          }
        },
        file_ignore_patterns = { "%.git", "node%_modules" },
      },
    })

  local opts = { silent = true, noremap = true }

  map('n', 'g<space>s',  '<cmd>lua _M.find_files_in_current_dir()<cr>', opts)
  map('n', '<space>s', '<cmd>lua _M.find_files_in_root_dir("/src")<cr>', opts)
  map('n', ',<space>t', '<cmd>lua _M.find_files_in_root_dir("/testcafe")<cr>', opts)
  map('n', ',<space>a', '<cmd>lua _M.find_files_in_root_dir("/api-mock")<cr>', opts)
  map('n', '<space>c',  '<cmd>lua _M.find_files_in_file_dir()<cr>', opts)
  map('n', '\\\\d',     '<cmd>lua _M.find_files_in_home_dir("/dotfiles")<cr>', opts)
  map('n', '<space>s',  '<cmd>lua _M.find_files_in_root_dir()<cr>', opts)
  map('n', '1<space>s',  '<cmd>lua _M.find_files_in_up_root_dir(1)<cr>', opts)
  map('n', '2<space>s',  '<cmd>lua _M.find_files_in_up_root_dir(2)<cr>', opts)
  map('n', '3<space>s',  '<cmd>lua _M.find_files_in_up_root_dir(3)<cr>', opts)

  map('n', ',<space>g', '<cmd>lua _M.live_grep_in_file_dir()<cr>', opts)
  map('n', 'g<space>g', '<cmd>lua _M.live_grep_in_current_dir()<cr>', opts)
  map('n', 'g<space>s', '<cmd>lua _M.live_grep_in_current_dir("/src")<cr>', opts)
  map('n', 'g<space>t', '<cmd>lua _M.live_grep_in_current_dir("/testcafe")<cr>', opts)
  map('n', 'g<space>a', '<cmd>lua _M.live_grep_in_current_dir("/api-mock")<cr>', opts)

  map('n', '<space>g',  '<cmd>lua _M.live_grep_in_root_dir()<cr>', opts)
  map('n', '1<space>g',  '<cmd>lua _M.live_grep_in_up_root_dir(1)<cr>', opts)
  map('n', '2<space>g',  '<cmd>lua _M.live_grep_in_up_root_dir(2)<cr>', opts)
  map('n', '3<space>g',  '<cmd>lua _M.live_grep_in_up_root_dir(3)<cr>', opts)

  map('n', '<space>b', '<cmd>lua require"telescope.builtin".buffers()<cr>', opts)
  map('n', '<space>l', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find()<cr>', opts)
  map('n', '\\r', '<cmd>lua require"telescope.builtin".resume()<cr>', opts)
  map('n', '\\s', '<cmd>lua _M.git_status_in_file_dir()<cr>', opts)
  map('n', '\\d', '<cmd>lua require"telescope.builtin".lsp_workspace_diagnostics()<cr>', opts)
  map('n', '\\c', '<cmd>lua require"telescope.builtin".commands()<cr>', opts)
  map('n', '\\\\h', '<cmd>lua require"telescope.builtin".help_tags()<cr>', opts)

  map('n', '\\\\b', '<cmd>lua require"telescope.builtin".builtin()<cr>', opts)

  map('n', ',a', '<cmd>lua require"telescope.builtin".lsp_code_actions({ layout_config = { width = 0.5, height = 0.5 } })<cr>', opts)
end

return telescope_config
