local map = vim.api.nvim_set_keymap

local function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         return true
      end
   end
   return ok
end

local function getGitRoot()
  local handler = io.popen('git rev-parse --show-toplevel')
  local root = handler:read('*a'):sub(1, -2)
  handler:close()

  return root
end

function _M.telescope_find_files_in_git_root()
  print('in git root here:', getGitRoot())
  require'telescope.builtin'.find_files({ cwd = getGitRoot() })
end

function _M.telescope_find_files_in_src()
  local root = getGitRoot()
  local src = root .. '/src'

  if exists(src) then
    require'telescope.builtin'.find_files({ cwd = src })
  else
    require'telescope.builtin'.find_files({ cwd = root })
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
      }
    },
  })

  map('n', '<space>r', ':lua _M.telescope_find_files_in_git_root()<cr>', { silent = true, noremap = true })
  map('n', '<space>s', ':lua _M.telescope_find_files_in_src()<cr>', { silent = true, noremap = true })
end

return telescope_config
