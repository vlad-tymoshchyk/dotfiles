local opt = vim.opt
local g = vim.g

-- opt.autoindent
-- opt.autoread
-- opt.backspace=indent,eol,start
-- opt.backupdir=~/.vim/temp
opt.clipboard = "unnamedplus"
-- opt.colorcolumn=0
-- opt.completeopt=longest,menuone
opt.completeopt = 'menu,menuone,noselect'
-- opt.confirm
opt.cursorline = true
-- opt.directory=~/.vim/temp
-- opt.display+=lastline
-- opt.encoding=utf-8
opt.expandtab = true
-- opt.exrc
-- opt.foldmethod=marker
-- opt.foldnestmax=2
-- opt.guifont=DroidSansMono\ Nerd\ Font\ 15
-- opt.guifont=JetBrainsMono\ Nerd\ Font\ 15
-- opt.hidden
-- opt.history=1000
opt.ignorecase = true
-- opt.laststatus=2
-- opt.lazyredraw
-- opt.linebreak
-- opt.mouse=a
-- opt.noerrorbells
-- opt.nofoldenable
-- opt.noshowmatch
-- opt.nosmarttab
-- opt.nospell
opt.swapfile = false
-- opt.novisualbell
-- opt.nowritebackup
opt.number = true
-- opt.omnifunc=syntaxcomplete#Complete
-- opt.path+=**
opt.relativenumber = true
-- opt.ruler
opt.scrolloff = 3
-- opt.secure
opt.shiftwidth = 2
opt.shiftround = true
-- opt.shortmess+=Ia
-- opt.sidescrolloff = 5
-- opt.smartcase
-- opt.smartindent
-- opt.splitbelow
-- opt.splitright
opt.tabstop = 2
-- opt.textwidth=0
-- opt.title
-- opt.undodir=~/.vim/temp
-- opt.wildmenu
-- opt.wrap
-- opt.grepprg="grep -R"
-- opt.grepformat=%f:%l:%c:%m
-- opt.fileformat=unix
-- opt.updatetime=300
-- opt.keywordprg=":h"

-- DEFAULT MAPPINGS:
-- opt.hlsearch = true
-- opt.incsearch = true

g.mapleader = ','

g.NERDDefaultAlign = 'left'
g.NERDSpaceDelims = 1

g.user_emmet_mode='in'
g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'
g.ale_set_loclist = 0
g.ale_set_quickfix = 1

g.startify_custom_header = ''
g.startify_change_to_dir = 0
g.NERDDefaultNesting=-1

g.AutoPairsShortcutBackInsert = "<M-a>"
