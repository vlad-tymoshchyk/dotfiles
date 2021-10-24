local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.number = true

-- " set autoindent
-- " set autoread
-- " set backspace=indent,eol,start
-- " set backupdir=~/.vim/temp
opt.clipboard = "unnamedplus"
-- " set colorcolumn=0
-- " set completeopt=longest,menuone
-- " set completeopt=menuone,noinsert,noselect
-- " set confirm
opt.cursorline = true
-- " set directory=~/.vim/temp
-- " set display+=lastline
-- " set encoding=utf-8
-- " set expandtab
-- " set exrc
-- " set foldmethod=marker
-- " set foldnestmax=2
-- " set guifont=DroidSansMono\ Nerd\ Font\ 15
-- " set guifont=JetBrainsMono\ Nerd\ Font\ 15
-- " set hidden
-- " set history=1000
-- " set hlsearch
-- " set ignorecase
-- " set incsearch
-- " set laststatus=2
-- " set lazyredraw
-- " set linebreak
-- " set mouse=a
-- " set noerrorbells
-- " set nofoldenable
-- " set noshowmatch
-- " set nosmarttab
-- " set nospell
-- " set noswapfile
-- " set novisualbell
-- " set nowritebackup
-- " set number
-- " set omnifunc=syntaxcomplete#Complete
-- " set path+=**
-- " set relativenumber
-- " set ruler
opt.scrolloff = 3
-- " set secure
-- " set shiftwidth=2
-- " set shiftround
-- " set shortmess+=Ia
-- opt.sidescrolloff = 5
-- " set smartcase
-- " set smartindent
-- " set splitbelow
-- " set splitright
-- " set tabstop=2
-- " set textwidth=0
-- " set title
-- " set undodir=~/.vim/temp
-- " set wildmenu
-- " set wrap
-- " set grepprg="grep -R"
-- " set grepformat=%f:%l:%c:%m
-- " set fileformat=unix
-- " set updatetime=300
-- " se keywordprg=":h"

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
g.NERDDefaultNesting=0
