local map = vim.api.nvim_set_keymap

map('i', 'jk', '<esc>', {})

map('i', '<c-j>', '<esc>:m .+1<cr>==i', {})
map('i', '<c-k>', '<esc>:m .-2<cr>==i', {})
map('n', '<c-j>', ':m .+1<cr>==', {})
map('n', '<c-k>', ':m .-2<cr>==', {})
map('v', '<c-j>', ':m \'>+1<cr>gv=gv', {})
map('v', '<c-k>', ':m \'<-2<cr>gv=gv', {})

map('', '<leader>f', '<Plug>(easymotion-bd-f)', {})
map('', '<leader>j', '<Plug>(easymotion-j)', {})
map('', '<leader>k', '<Plug>(easymotion-k)', {})
map('', '<leader>w', '<Plug>(easymotion-w)', {})
map('', '<leader>b', '<Plug>(easymotion-b)', {})

map('n', 'q;', 'q:', {})
map('v', 'q;', 'q:', {})

map('n', '<leader>gh', ':call CocAction("doHover")<cr>', { silent = true, noremap = true })
map('n', '<leader>gn', ':ALERename<cr>', { silent = true, noremap = true })
map('n', '<leader>gv', ':GitGutterPreviewHunk<cr>', { silent = true, noremap = true })
map('n', '<leader>gc', ':GitGutterUndoHunk<cr>', { silent = true, noremap = true })
map('n', '<leader>gs', ':GitGutterStageHunk<cr>', { silent = true, noremap = true })
map('n', '<c-x>a', ':!git add %<cr>', { silent = true, noremap = true })
map('n', '<C-x>b', ':Gblame<cr>', { silent = true, noremap = true })
-- map('n', '<C-x>f', ':NvimTreeFindFile<CR>', { silent = true, noremap = true })
map('n', '<C-x>f', ':NERDTreeFind<CR>', { silent = true, noremap = true })
map('n', '<C-x>s', ':Gstatus<cr>', { silent = true, noremap = true })
map('n', '<C-w>t', ':tabe<cr>', { silent = true, noremap = true })
map('n', '<c-w>Q', ':tabclose<cr>', { silent = true, noremap = true })
map('n', '<c-w>O', ':tabonly<cr>', { silent = true, noremap = true })
map('n', '\\s', ':Snippets<cr>', { silent = true, noremap = true })
map('n', '\\m', ':Maps<cr>', { silent = true, noremap = true })
map('n', '<Space>p', ':Prettier<cr>', { silent = true, noremap = true })
map('n', '<Space>n', ':NERDTreeToggle<cr>', { silent = true, noremap = true })
map('n', '<Space>i', ':GFiles?<cr>', { silent = true, noremap = true })
map('n', '<Space>h', ':History<cr>', { silent = true, noremap = true })
map('n', '<Space>a', ':A<cr>', { silent = true, noremap = true })
map('n', '<esc>', ':noh<cr>', { silent = true, noremap = true })
map('n', '[W', '<Plug>(ale_first)', { silent = true, noremap = true })
map('n', ']W', '<Plug>(ale_last)', { silent = true, noremap = true })
map('n', '[w', '<Plug>(ale_previous)', { silent = true, noremap = true })
map('n', ']w', '<Plug>(ale_next)', { silent = true, noremap = true })

map('n', 'ĝ', 'w', { silent = true })
map('n', 'ŭ', 'y', { silent = true })
map('n', 'ŝ', 'q', { silent = true })
map('n', 'ĉ', 'x', { silent = true })
map('n', 'ĵ', '[', { silent = true })
map('n', 'ĥ', ']', { silent = true })
map('n', 'Ñ', ':', { silent = true, noremap = true })

map('n', ',,', ',', { silent = true, noremap = true })
map('n', '<C-e>', '<C-w>', { silent = true, noremap = true })
map('n', '<C-w>', '<Nop>', { silent = true, noremap = true })

map('n', 'vv', 'ggVG', { silent = true, noremap = true })
map('v', 'y', 'y`]', { silent = true, noremap = true }) -- blocked coping to registers, trying to do without it

map('n', '<leader>r', ':Reload<cr>', { noremap = true })

map('n', '\\\\r', ':lua R("init")<cr>', { silent = true, noremap = true })

map('n', 'g==', 'ggVG=<C-o>', { silent = true, noremap = true })
