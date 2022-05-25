local u = R'utils'
local map = vim.api.nvim_set_keymap
local tb

local function showNoSuchFolder(dir)
  print('NO SUCH FOLDER: ' .. u.trimPath(dir, 2))
end

local function getErrorMessage(dir)
  return u.getRoot() .. '/!(' .. u.getRelativePath(dir) .. ')'
end

local function find_files(dir, options)
  local message
  local path
  if u.exists(dir) then
    path = dir
    message = u.trimPath(path, 2)
  else
    path = u.getRoot()
    message = getErrorMessage(dir)
  end

  local mergedOptions = u.mergeTables({ cwd = path, hidden = true, prompt_title = message }, options or {})

  tb.find_files(mergedOptions)
end

function ffind_files(dir, options)
  return function()
    find_files(dir, options)
  end
end

local function live_grep(dir, options)
  local message
  local path
  if u.exists(dir) then
    path = dir
    message = u.trimPath(path, 2)
  else
    path = u.getRoot()
    message = getErrorMessage(dir)
  end

  local mergedOptions = u.mergeTables({ cwd = path, prompt_title = 'GREP: ' .. message, additional_args = additional_args }, options or {})

  tb.live_grep(mergedOptions)
end

function llive_grep(dir, options)
  return function()
    live_grep(dir, options)
  end
end

-- function _M.find_files_in_root_dir(dir) find_files( u.getRoot() .. (dir or '') ) end
function _M.find_files_in_home_dir(dir) find_files( u.getHome() .. (dir or '') ) end
function _M.find_files_in_current_dir(dir) find_files( u.getCwd() .. (dir or '') ) end

function getUpRootDir(i) 
  if i == nil or i == 0 then
    return u.getRoot()
  else
    return u.getRoot() .. '/' .. u.trimPath(u.getProjectFilePath(u.getRoot(), u.getFileDir()), -i) 
  end
end
function getDownFileDir(i) return '/' .. u.trimPath(u.getFileDir(), 0, i) end

function _M.find_files_up_root_dir(i) find_files(getUpRootDir(i), i) end
function find_files_up_root_dir(i) find_files(getUpRootDir(i), i) end
function _M.find_files_down_file_dir(i) find_files(getDownFileDir(i), -i) end
function _M.live_grep_up_root_dir(i) live_grep(getUpRootDir(i), i) end
function _M.live_grep_down_file_dir(i) live_grep(getDownFileDir(i), -i) end

function _M.live_grep_in_file_dir(dir) live_grep( u.getFileDir() .. (dir or '') ) end
-- function _M.live_grep_in_root_dir(dir) live_grep( u.getRoot() .. (dir or '') ) end
function _M.live_grep_in_home_dir(dir) live_grep( u.getHome() .. (dir or '') ) end
function _M.live_grep_in_current_dir(dir) live_grep( u.getCwd() .. (dir or '') ) end

function _M.git_status_in_file_dir(dir) 
  require'telescope.builtin'.git_status({ cwd = u.getFileDir() })
end

local function find_files_in_root_dir(dir)
  return ffind_files( u.getRoot() .. (dir or '') )
end

local function live_grep_in_root_dir(dir)
  return llive_grep( u.getRoot() .. (dir or '') )
end

local function find_with_options(dir, options)
  local mergedOptions = u.mergeTables({ "find", ".", "-type", "f" }, options)
  return ffind_files(u.getRoot() .. dir, { find_command = mergedOptions })
end

local telescope_config = function()
  local actions = require('telescope.actions')
  tb = require'telescope.builtin'

  require('telescope').setup({
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",

        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          }
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

  --[[
Logic behind keymaps
<space>s - search files in root directory (add number to go up forward file directory) (add dir to search in dir)
<space>c - search files in file directory (add number to go down forward root directory)
<space>g - live grep in root directory (add number to go up forward file directory) (add dir to search in dir)
,<space>g - live grep in file directory (add number to go down forward root directory)
,m<space> a/s/t - search in special directories
,mm<space> a/s/t - live grep in special directories
--]]

  vim.keymap.set({ 'n' }, '<leader>mmb', function() 
    require'telescope.builtin'.live_grep{ 
      grep_open_files = true,
      prompt_title = 'GREP OPEN FILES'
  } end, opts)

local testRegex = "\\.(test|spec)\\.[a-z]{1,3}$"
local regexTestFiles = ".*\\.\\(test\\|spec\\)\\.[a-z]*"

vim.keymap.set({ 'n' }, '<leader>ms', find_with_options("/src", { "-not", "-regex", regexTestFiles }), opts)
vim.keymap.set({ 'n' }, '<leader>mu', find_with_options("/src", { "-regex", regexTestFiles }), opts)
vim.keymap.set({ 'n' }, '<leader>mS', find_with_options("/src", {}), opts)
vim.keymap.set({ 'n' }, '<leader>mt', find_with_options("/testcafe", {}), opts)
vim.keymap.set({ 'n' }, '<leader>ma', find_with_options("/api-mock", {}), opts)

vim.keymap.set({ 'n' }, '<leader>mms', live_grep_in_root_dir("/src"), opts)
vim.keymap.set({ 'n' }, '<leader>mmt', live_grep_in_root_dir("/testcafe"), opts)
vim.keymap.set({ 'n' }, '<leader>mma', live_grep_in_root_dir("/api-mock"), opts)

vim.keymap.set({ 'n' }, '<leader>mb', function() tb.buffers() end, opts)
vim.keymap.set({ 'n' }, '<leader>mo', function() tb.oldfiles() end, opts)

map('n', '<space>s',  '<cmd>lua _M.find_files_up_root_dir(0)<cr>', opts)
map('n', '1<space>s',  '<cmd>lua _M.find_files_up_root_dir(1)<cr>', opts)
map('n', '2<space>s',  '<cmd>lua _M.find_files_up_root_dir(2)<cr>', opts)
map('n', '3<space>s',  '<cmd>lua _M.find_files_up_root_dir(3)<cr>', opts)
map('n', '4<space>s',  '<cmd>lua _M.find_files_up_root_dir(4)<cr>', opts)
map('n', '5<space>s',  '<cmd>lua _M.find_files_up_root_dir(5)<cr>', opts)
map('n', '0<space>s',  '<cmd>lua _M.find_files_down_file_dir(0)<cr>', opts)
map('n', '11<space>s',  '<cmd>lua _M.find_files_down_file_dir(1)<cr>', opts)
map('n', '22<space>s',  '<cmd>lua _M.find_files_down_file_dir(2)<cr>', opts)
map('n', '33<space>s',  '<cmd>lua _M.find_files_down_file_dir(3)<cr>', opts)
map('n', '44<space>s',  '<cmd>lua _M.find_files_down_file_dir(4)<cr>', opts)
map('n', '55<space>s',  '<cmd>lua _M.find_files_down_file_dir(5)<cr>', opts)

map('n', '<space>g',  '<cmd>lua _M.live_grep_up_root_dir(0)<cr>', opts)
map('n', '1<space>g',  '<cmd>lua _M.live_grep_up_root_dir(1)<cr>', opts)
map('n', '2<space>g',  '<cmd>lua _M.live_grep_up_root_dir(2)<cr>', opts)
map('n', '3<space>g',  '<cmd>lua _M.live_grep_up_root_dir(3)<cr>', opts)
map('n', '4<space>g',  '<cmd>lua _M.live_grep_up_root_dir(4)<cr>', opts)
map('n', '5<space>g',  '<cmd>lua _M.live_grep_up_root_dir(5)<cr>', opts)
map('n', '0<space>g',  '<cmd>lua _M.live_grep_down_file_dir(0)<cr>', opts)
map('n', '11<space>g',  '<cmd>lua _M.live_grep_down_file_dir(1)<cr>', opts)
map('n', '22<space>g',  '<cmd>lua _M.live_grep_down_file_dir(2)<cr>', opts)
map('n', '33<space>g',  '<cmd>lua _M.live_grep_down_file_dir(3)<cr>', opts)
map('n', '44<space>g',  '<cmd>lua _M.live_grep_down_file_dir(4)<cr>', opts)
map('n', '55<space>g',  '<cmd>lua _M.live_grep_down_file_dir(5)<cr>', opts)

map('n', '\\\\d',     '<cmd>lua _M.find_files_in_home_dir("/dotfiles")<cr>', opts)

map('n', '<space>l', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find()<cr>', opts)
map('n', '\\r', '<cmd>lua require"telescope.builtin".resume()<cr>', opts)
map('n', '\\s', '<cmd>lua _M.git_status_in_file_dir()<cr>', opts)
map('n', '\\d', '<cmd>lua require"telescope.builtin".lsp_workspace_diagnostics()<cr>', opts)
map('n', '\\\\c', '<cmd>lua require"telescope.builtin".commands()<cr>', opts)
map('n', '\\\\h', '<cmd>lua require"telescope.builtin".help_tags()<cr>', opts)
map('n', '\\\\b', '<cmd>lua require"telescope.builtin".builtin()<cr>', opts)
map('n', ',a', '<cmd>lua require"telescope.builtin".lsp_code_actions({ layout_config = { width = 0.5, height = 0.5 } })<cr>', opts)
map('n', '\\c', '<cmd>lua require"telescope".extensions.neoclip.default()<cr>', opts)

map('n', '<leader>gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', opts)
end

return telescope_config
