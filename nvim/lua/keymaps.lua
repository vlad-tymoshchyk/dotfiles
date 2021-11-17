local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

local u = R('utils')
function _M.tmux_split_horizontal()
  -- local pwd = u.getCwd()
  -- print('pwd:' .. pwd)
end

map('i', 'jk', '<esc>', opts)

map('n', ',,', ',', opts)
map('n', 'vv', 'ggVG', opts)
map('v', 'y', 'y`]', opts)
map('n', 'g==', 'ggVG=<C-o>', opts)
map('n', '<C-e>', '<C-w>', opts)
map('n', '<C-w>', '<Nop>', opts)
map('n', '?', '/\\C', opts)

-- map('i', '<c-j>', '<esc>:m .+1<cr>==i', opts)
-- map('i', '<c-k>', '<esc>:m .-2<cr>==i', opts)
map('i', '<c-j>', '<cmd>lua print("CTRL pressed!!!")<cr>', opts)
map('i', '<c-k>', '<cmd>lua print("CTRL pressed!!!")<cr>', opts)
-- map('n', '<c-j>', ':m .+1<cr>==', opts)
-- map('n', '<c-k>', ':m .-2<cr>==', opts)
map('n', '<c-j>', '<cmd>lua print("CTRL pressed!!!")<cr>', opts)
map('n', '<c-k>', '<cmd>lua print("CTRL pressed!!!")<cr>', opts)

map('v', '<c-j>', ':m \'>+1<cr>gv=gv', opts)
map('v', '<c-k>', ':m \'<-2<cr>gv=gv', opts)

map('', '<leader>f', '<Plug>(easymotion-bd-f)', {})
map('', '<leader>j', '<Plug>(easymotion-j)', {})
map('', '<leader>k', '<Plug>(easymotion-k)', {})
map('', '<leader>w', '<Plug>(easymotion-w)', {})
map('', '<leader>b', '<Plug>(easymotion-b)', {})

map('n', 'q;', 'q:', opts)
map('v', 'q;', 'q:', opts)

map('n', '<leader>gv', ':GitGutterPreviewHunk<cr>', opts)
map('n', '<leader>gc', ':GitGutterUndoHunk<cr>', opts)
map('n', '<leader>gs', ':GitGutterStageHunk<cr>', opts)
map('n', '<C-x>b', ':Git blame<cr>', opts)
map('n', '<C-x>f', ':NERDTreeFind<CR>', opts)
map('n', '<C-w>O', ':tabonly<cr>', opts)
map('n', '<Space>p', ':Prettier<cr>', opts)
map('n', '<C-x>t', ':NERDTreeToggle<cr>', opts)
map('n', '<esc>', ':noh<cr>', opts)

-- map('n', 'ĝ', 'w', { silent = true })
-- map('n', 'ŭ', 'y', { silent = true })
-- map('n', 'ŝ', 'q', { silent = true })
-- map('n', 'ĉ', 'x', { silent = true })
-- map('n', 'ĵ', '[', { silent = true })
-- map('n', 'ĥ', ']', { silent = true })
-- map('n', 'Ñ', ':', opts)

map('n', '\\\\r', '<cmd>lua R("init")<cr>', opts)
map('n', '<C-e>|', '<cmd>lua _M.tmux_split_horizontal()<cr>', opts)
