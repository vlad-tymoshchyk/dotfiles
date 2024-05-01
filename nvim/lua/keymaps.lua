local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

local u = R('utils')
function _M.tmux_split_horizontal()
  u.execute('tmux split-window -h -c ' .. u.getFileDir())
end
function _M.tmux_split_vertical()
  u.execute('tmux split-window -v -c ' .. u.getFileDir())
end
function _M.tmux_new_window()
  u.execute('tmux new-window -c ' .. u.getFileDir())
end

map('i', 'jk', '<esc>', opts)

map('n', 'ZZ', ':w<cr>', opts)

map('n', ',,', ',', opts)
map('n', 'vv', 'ggVG', opts)
map('v', 'y', 'y`]', opts)
map('n', 'g==', 'ggVG=<C-o>', opts)
map('n', '<C-w>', '<Nop>', opts)
map('n', '?', '/\\C', opts)

-- map('i', '<c-j>', '<esc>:m .+1<cr>==i', opts)
-- map('i', '<c-k>', '<esc>:m .-2<cr>==i', opts)
map('i', '<c-j>', '<cmd>lua print("CTRL pressed!!! (j)")<cr>', opts)
map('i', '<c-k>', '<cmd>lua print("CTRL pressed!!! (k)")<cr>', opts)
-- map('n', '<c-j>', ':m .+1<cr>==', opts)
-- map('n', '<c-k>', ':m .-2<cr>==', opts)
map('n', '<c-j>', '<cmd>lua print("CTRL pressed!!!")<cr>', opts)
map('n', '<c-k>', '<cmd>lua print("CTRL pressed!!!")<cr>', opts)

map('v', '<c-j>', ':m \'>+1<cr>gv=gv', opts)
map('v', '<c-k>', ':m \'<-2<cr>gv=gv', opts)

map('n', 'q;', 'q:', opts)
map('v', 'q;', 'q:', opts)

map('n', '<leader>gv', ':GitGutterPreviewHunk<cr>', opts)
map('n', '<leader>gu', ':GitGutterUndoHunk<cr>', opts)
map('n', '<leader>gs', ':GitGutterStageHunk<cr>', opts)
map('n', '-ef', ':NERDTreeFind<CR>', opts)
map('n', '-et', ':NERDTreeToggle<cr>', opts)
map('n', '-eO', ':tabonly<cr>', opts)
map('n', '-e', '<C-w>', opts)
map('n', '-p', ':Prettier<cr>', opts)
map('n', '-xt', ':!tmux split-window -hd "npm run test:watch -- %:p"<cr>', opts)
map('n', '-xb', ':Git blame<cr>', opts)

map('n', '<esc>', ':noh<cr>', opts)

-- map('n', 'ĝ', 'w', { silent = true })
-- map('n', 'ŭ', 'y', { silent = true })
-- map('n', 'ŝ', 'q', { silent = true })
-- map('n', 'ĉ', 'x', { silent = true })
-- map('n', 'ĵ', '[', { silent = true })
-- map('n', 'ĥ', ']', { silent = true })
-- map('n', 'Ñ', ':', opts)

map('n', '\\\\r', '<cmd>lua R("init")<cr>', opts)
map('n', '\\\\x', ':!chmod u+x %<cr>', opts)
map('n', '\\\\t', ':silent !tmux neww tmux-sessionizer<cr>', opts)
map('n', '<C-w>|', '<cmd>lua _M.tmux_split_horizontal()<cr>', opts)
map('n', '<C-w>_', '<cmd>lua _M.tmux_split_vertical()<cr>', opts)
map('n', '<C-w>c', '<cmd>lua _M.tmux_new_window()<cr>', opts)

map('n', 'g/', ':%s/', opts)
map('v', 'g/', ':s/', opts)

map('n', '2vv', 'Vj', opts)
map('n', '3vv', 'V2j', opts)
map('n', '4vv', 'V3j', opts)
map('n', '5vv', 'V4j', opts)
map('n', '6vv', 'V5j', opts)
map('n', '7vv', 'V6j', opts)
map('n', '8vv', 'V7j', opts)
map('n', '9vv', 'V8j', opts)

map('n', '<C-i>', '<C-a>', opts)
map('n', '<A-i>', '<C-x>', opts)

map('i', 'см', '<esc>', opts);
map('n', 'ф', 'a', opts);
map('n', 'Ф', 'A', opts);
map('n', 'т', 'b', opts);
map('n', 'е', 'y', opts);
map('n', 'ее', 'yy', opts);
map('n', 'К', 'P', opts);
map('n', 'к', 'p', opts);
map('n', 'б', 'w', opts);
map('n', 'Б', 'W', opts);
map('n', 'в', 'e', opts);
map('n', 'В', 'E', opts);
map('n', 'п', 'i', opts);
map('n', 'П', 'I', opts);
map('n', 'Ж', 'S', opts);
map('n', 'ж', 's', opts);
map('n', 'щ', 'r', opts);
map('n', 'і', 'o', opts);
map('n', 'І', 'O', opts);
map('n', 'с', 'j', opts);
map('n', 'м', 'k', opts);
map('n', 'о', 'h', opts);
map('n', 'з', 'l', opts);
map('n', 'гг', 'gg', opts);
map('n', 'Г', 'G', opts);
map('n', 'рр', 'dd', opts);
map('n', 'Ш', 'C', opts);
map('n', 'и', 'x', opts);
map('n', 'Р', 'D', opts);
map('n', 'С', 'J', opts);
map('n', 'а', 'u', opts);
map('n', '<c-щ>', '<c-r>', opts);

map('n', ',,', ':w<cr>',opts);
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
  })
vim.g.copilot_no_tab_map = true
