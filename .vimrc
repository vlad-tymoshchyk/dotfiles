call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'lervag/vimtex'
" Plug 'majutsushi/tagbar'
" Plug 'maksimr/vim-jsbeautify'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'mileszs/ack.vim'
" Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'rhysd/vim-clang-format'
" Plug 'vim/killersheep'
" Plug 'xavierchow/vim-swagger-preview'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'PProvost/vim-ps1'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'dracula/vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'othree/html5.vim'
Plug 'prettier/vim-prettier'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
call plug#end()

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/temp
set clipboard+=unnamedplus
set colorcolumn=0
set completeopt=longest,menuone
set confirm
set cursorline
set directory=~/.vim/temp
set display+=lastline
set encoding=utf-8
set expandtab
set exrc
set foldmethod=marker
set foldnestmax=2
set guifont=DroidSansMono\ Nerd\ Font\ 15
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set mouse=a
set noerrorbells
set nofoldenable
set noshowmatch
set nosmarttab
set nospell
set noswapfile
set novisualbell
set nowritebackup
set number
set omnifunc=syntaxcomplete#Complete
set path+=**
set relativenumber
set ruler
set runtimepath+=~/dotfiles
set scrolloff=0
set scrolloff=7
set secure
set shiftwidth=2
set shortmess+=Ia
set sidescrolloff=5
set smartcase
set smartindent
set splitbelow
set splitright
set tabstop=2
set textwidth=0
set title
set undodir=~/.vim/temp
set wildmenu
set wrap
set grepprg="grep -R"
set grepformat=%f:%l:%c:%m
set fileformat=unix
set updatetime=300

inoremap <silent><expr> <C-n> pumvisible() ? "\<C-n>" : coc#refresh()
inoremap jk <esc>
nmap <leader>f <Plug>(easymotion-s)
nmap <leader>t <Plug>(easymotion-bd-jk)
nnoremap ! :!
nnoremap <C-w>t :tabe<cr>
nnoremap <Down> j<c-e>
nnoremap <F11> :Goyo<cr>
nnoremap <Up> k<c-y>
nnoremap <backspace> i<backspace><esc>l
nnoremap <c-w>O :tabonly<cr>
nnoremap <c-w>Q :tabclose<cr>
nnoremap <c-x>a :!git add %<cr>
nnoremap <enter> i<enter><esc>l
nnoremap <leader>, ,
nnoremap <silent> <C-p> :GFiles<cr>
nnoremap <silent> <C-x>b :Gblame<cr>
nnoremap <silent> <C-x>f :NERDTreeFind<cr>
nnoremap <silent> <C-x>h :vs<cr>:Files<cr>
nnoremap <silent> <C-x>l :Files<cr>
nnoremap <silent> <C-x>p :Prettier<cr>
nnoremap <silent> <C-x>s :Gstatus<cr>
nnoremap <silent> <esc> :noh<cr>
nnoremap <silent> <leader>? :ALEDetail<cr>
nnoremap <silent> <leader>aj :ALENext<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>
nnoremap <silent> <leader>l :Buffers<cr>
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]W <Plug>(ale_last)
nnoremap <silent> ]w <Plug>(ale_next)
" nnoremap gd <Plug>(coc-definition)
nnoremap vv ggVG
noremap <silent> <F6> :GundoToggle<cr>
noremap <silent> <F7> :NERDTreeToggle<cr>
noremap <silent> <F8> :TagbarToggle<cr>
vnoremap y may`a

let g:polyglot_disabled = ['latex']

" let $FZF_DEFAULT_COMMAND = "fd --ignore-case --hidden --type f --exclude .git"
let $FZF_DEFAULT_COMMAND = "fdfind --ignore-case --hidden --type f --exclude .git"
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"
" let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:indentLine_enabled = 0
let g:snipMate = {}
let g:snipMate.override = 1
let g:ycm_key_list_select_completion = ["<leader><Tab>"]
let g:ycm_key_list_stop_completion = "<esc>"
let mapleader = ","

language en_US.utf8

if !has('nvim')
  set guifont=Consolas:h15
endif
let g:mkdp_preview_options = {
      \   'maid': {
      \     'theme': 'default'
      \   }
      \ }

" Emmet
let g:user_emmet_mode='in'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
      \  'javascript': ['eslint']
      \}

if has('nvim')
  let g:NERDTreeDirArrowExpandable = "▸"
  let g:NERDTreeDirArrowCollapsible = "▾" 
endif

command! Conf source ~/.vimrc
command! Vifmrc tabe ~/.config/vifm/vifmrc
command! Vimrc tabe ~/dotfiles/.vimrc
command! Zshrc tabe ~/dotfiles/.zshrc

function! ToggleEndChar(char)
  let l:lastchar = getline('.')[col('$') - 2]
  if l:lastchar ==# ',' || l:lastchar ==# ';'
    exe "normal! mz$x`z"
  else
    exe "normal! mzA" . a:char . "`z"
  endif
endfunction
nnoremap <silent> <leader>c, :call ToggleEndChar(',')<cr>
nnoremap <silent> <leader>c; :call ToggleEndChar(';')<cr>;

if has('gui_running')
  colorscheme dracula
  se guioptions -=m
  se guioptions -=T
  se guioptions -=r
  se guioptions -=R
  se guioptions -=l
  se guioptions -=L
  se guioptions +=c
endif

command! Delete call delete(expand('%')) | bdelete!

let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'
let g:coc_config_home="~/dotfiles"

autocmd BufWritePost */.vimrc :Conf

hi CursorLine ctermbg=232

colorscheme gruvbox

inoremap [<cr> [<cr>]<esc>O
inoremap [<space> [  ]<left><left>
inoremap {<cr> {<cr>}<esc>O
inoremap {<space> {  }<left><left>

" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gr <Plug>(coc-references)
" nmap <leader>gs :G<cr>

" command! LU :w || source ~/test/vim/test.lua

lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }

se completeopt=menuone,noinsert,noselect

" let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']

let g:NERDTreeMinimalUI = 1

nmap <silent> * :let @/='\v<'.expand('<cword>').'>'<cr>:let v:searchforward=1<cr>n
nmap <silent> # :let @/='\v<'.expand('<cword>').'>'<cr>:let v:searchforward=0<cr>n
nmap <silent> g* :let @/='\v'.expand('<cword>')<cr>:let v:searchforward=1<cr>n
nmap <silent> g# :let @/='\v'.expand('<cword>')<cr>:let v:searchforward=0<cr>n
