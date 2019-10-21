call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'PProvost/vim-ps1'
Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --tern-completer' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rhysd/vim-clang-format'
" Plug 'ternjs/tern_for_vim'
Plug 'tomtom/tlib_vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'sjl/gundo.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

let g:indentLine_enabled = 0


"
" vim-settings
"
" TEMPORARY OPRIONS, LATER SHOULD BE TRANSMITED TO THE RIGHT PLACE
set exrc
set secure
set path+=**

" end

" OPTIONS ======================================================= 
" [https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/]
" 	Indention =================
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set nosmarttab

"	Search ======================
set hlsearch
set ignorecase
set incsearch
set smartcase

"	Persormance =================
set lazyredraw

"	Text rendering ==============
set display+=lastline
set encoding=UTF-8
set linebreak
set scrolloff=7
set sidescrolloff=5
set wrap

"	User interface ==============
set laststatus=2
set ruler
set wildmenu
set cursorline
set number
set norelativenumber
set title
set noerrorbells
set novisualbell
set mouse=a

"	Code folding ================
set foldmethod=marker
set nofoldenable
set foldnestmax=2

"	Miscellaneous options =======
set autoread
set backupdir=~/.cache/vim
set dir=~/.cache/vim
set confirm
set hidden
set history=1000
set noswapfile
" set shell=powershell
set spell

colorscheme desert
set encoding=UTF-8
" set guifont=Consolas:h15
set cursorline

set noshowmatch		" cursor no jumps to parent bracket
set backspace=indent,eol,start

language en_US.utf8
se shortmess+=Ia


set colorcolumn=0





" TEMPORARY OPRIONS, LATER SHOULD BE TRANSMITED TO THE RIGHT PLACE
set exrc
set secure
set path+=**

" end

" OPTIONS ======================================================= 
" [https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/]
" 	Indention =================
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nosmarttab

"	Search ======================
set hlsearch
set ignorecase
set incsearch
set smartcase

"	Persormance =================
set lazyredraw

"	Text rendering ==============
set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=0
set sidescrolloff=5
set wrap
set textwidth=0

"	User interface ==============
set laststatus=2
set ruler
set wildmenu
set cursorline
set number
set norelativenumber
set title
set noerrorbells
set novisualbell
set mouse=a

"	Code folding ================
set foldmethod=manual
set nofoldenable
set foldnestmax=2

"	Miscellaneous options =======
set autoread
set backupdir=~/.vim/temp
set directory=~/.vim/temp
set undodir=~/.vim/temp
set nowritebackup
set confirm
set hidden
set history=1000
set noswapfile
" set shell=powershell
set nospell

set encoding=UTF-8
if !has('nvim')
  set guifont=Consolas:h15
endif
set cursorline
set colorcolumn=0

set noshowmatch		" cursor no jumps to parent bracket
set backspace=indent,eol,start


"
" variables
"
let mapleader = ","

" NERDTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" YouCompleteMe
let g:ycm_key_list_stop_completion = "<esc>"
let g:ycm_key_list_select_completion = ["<leader><Tab>"]

"UltiSnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" FZF
let $FZF_DEFAULT_COMMAND = "fd --ignore-case --hidden --type f --exclude .git"

let g:snipMate = {}
let g:snipMate.override = 1

" vim-closetag
" let g:closetag_filenames = '*.html,*.js,*.jsx'

let g:mkdp_preview_options = {
      \   'maid': {
      \     'theme': 'default'
      \   }
      \ }

" Emmet
let g:user_emmet_mode='in'
" let g:user_emmet_leader_key='<c-,>'
"
let g:ale_linters = {
      \  'javascript': ['eslint']
      \}

if has('nvim')
  let g:NERDTreeDirArrowExpandable = "▸"
  let g:NERDTreeDirArrowCollapsible = "▾" 
endif


"
" mappings
"
inoremap jk <esc>
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

nnoremap vv ggVG

" FUNCTIONAL KEYS
noremap <silent> <F6> :GundoToggle<cr>
noremap <silent> <F7> :NERDTreeToggle<cr>
noremap <silent> <F8> :TagbarToggle<cr>

nmap <c-,> <c-y>,
imap <c-,> <c-y>,jk

" under doubt, TODO: find another function for these keys
nnoremap <space> i<space><esc>l
nnoremap <enter> i<enter><esc>l
nnoremap <backspace> i<backspace><esc>l

inoremap {<cr> {<cr>}<esc>O
inoremap {<space> {  }<left><left>
inoremap [<cr> [<cr>]<esc>O
inoremap [<space> [  ]<left><left>

" easy-motion configs
nmap t <Plug>(easymotion-bd-w)
nmap f <Plug>(easymotion-s)
nmap M <Plug>(easymotion-bd-jk)


nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <silent> ]W <Plug>(ale_last)

nnoremap <silent> <esc> :noh<cr>

nnoremap <Up> k<c-y>
nnoremap <Down> j<c-e>

nnoremap <silent> : :Files<cr>


" shortcuts for buffers
nnoremap <leader>1 :b 1<cr>
nnoremap <leader>2 :b 2<cr>
nnoremap <leader>3 :b 3<cr>
nnoremap <leader>4 :b 4<cr>
nnoremap <leader>5 :b 5<cr>
nnoremap <leader>6 :b 6<cr>
nnoremap <leader>7 :b 7<cr>
nnoremap <leader>8 :b 8<cr>
nnoremap <leader>9 :b 9<cr>
nnoremap <silent> <leader>l :Buffers<cr>
nnoremap <leader>. :b


nnoremap <silent> <leader>c, :call ToggleEndChar(',')<cr>
nnoremap <silent> <leader>c; :call ToggleEndChar(';')<cr>


"
" commands
"
command! Vimrc tabe ~/.vimrc
command! Conf source ~/.vimrc

" source ~\vimscripts\
command! Font Guifont Consolas:h15

command! SortWords call setline('.', join(sort(split(getline('.'), ' ')), " "))
command! ClearDebug :g/* debugging-console */d 


"
" functions
"
function! ToggleEndChar(char)
  let l:lastchar = getline('.')[col('$') - 2]
  if l:lastchar ==# ',' || l:lastchar ==# ';'
    exe "normal! mz$x`z"
  else
    exe "normal! mzA" . a:char . "`z"
  endif
endfunction


nnoremap <silent> <leader>aj :ALENext<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>
if has('gui_running')
  colorscheme dracula
  se guioptions -=m
  se guioptions -=T
  se guioptions -=r
  se guioptions -=R
  se guioptions -=l
  se guioptions -=L
  se guioptions +=c

  " if has('win32')
  "   se shell=powershell.exe
  " endif
  tnoremap <a-h> <c-\><c-n>gT
  tnoremap <a-l> <c-\><c-n>gt
  tnoremap <leader>s <c-\><c-n><c-w>W
  tnoremap <leader>d <c-\><c-n><c-w>w
  " tnoremap <esc> <c-\><c-n>
  tnoremap jk <c-\><c-n>
  tnoremap <leader>q <c-\><c-n>:q<cr>
endif

if has('nvim')
  colorscheme dracula
  if has('win32')
    se shell=powershell.exe
  endif
  autocmd VimEnter :Guifont Consolas:h15

  tnoremap <a-h> <c-\><c-n>gT
  tnoremap <a-l> <c-\><c-n>gt
  tnoremap <leader>s <c-\><c-n><c-w>W
  tnoremap <leader>d <c-\><c-n><c-w>w
  " tnoremap <esc> <c-\><c-n>
  tnoremap jk <c-\><c-n>
  tnoremap <leader>q <c-\><c-n>:q<cr>

  au! TermOpen * call CustomizeAfterTermOpen()
  au! BufEnter *powershell.exe call CustomizeAfterTermEnter()
  au! BufLeave *powershell.exe call CustomizeAfterTermLeave()

  function! CustomizeAfterTermOpen()
    se nonumber
    se foldcolumn=3
    se nospell
    syn region Search start=/PS/ end=/>/
    start
  endfunction
  function! CustomizeAfterTermEnter()
    start
  endfunction
  function! CustomizeAfterTermLeave()
  endfunction

  command! Vterm call OpenSideTerminal()
  function! OpenSideTerminal()
    exe ":vs"
    exe "<c-w>w"
    echo "doen"
  endfunction
endif

command! Delete call delete(expand('%')) | bdelete!
hi CursorLine ctermbg=232

se grepprg=ack\ --nogroup\ $*
se grepformat=%f:%l:%c:%m

se fileformat=unix

inoremap ;w <esc>:w<cr>

" not relevant now
" nnoremap <F1> :se ft=javascript.jsx<cr>
" nnoremap <F2> :se ft=jsx<cr>
" inoremap <F1> <esc>:se ft=javascript.jsx<cr>a
" inoremap <F2> <esc>:se ft=jsx<cr>a

set guifont=Monospace\ Regular\ 14
