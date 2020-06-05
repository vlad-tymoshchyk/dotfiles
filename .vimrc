function! g:WriteLog(...)
  let l:file='/home/vlad/sandboxes/sandbox-nvim/log'

  if a:1=="CLEAR"
    call writefile([], file) " UNCOMMENT TO CLEAR LOG FILE
  else
    new
    setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
    put!='[' . strftime('%H:%M:%S') . ']: ' . join(a:000)
    norm Gdd
    silent execute 'w >>' l:file
    q
  endif
  " call writefile([], file) " UNCOMMENT TO CLEAR LOG FILE
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim/killersheep'
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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
" Plug 'majutsushi/tagbar'
Plug 'maksimr/vim-jsbeautify'
" Plug 'mattn/emmet-vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
" Plug 'mxw/vim-jsx'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'othree/html5.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier'
Plug 'rhysd/vim-clang-format'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
" Plug 'xavierchow/vim-swagger-preview'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

Plug 'tmux-plugins/vim-tmux'
Plug 'mileszs/ack.vim'

Plug 'lervag/vimtex'

call plug#end()

let g:polyglot_disabled = ['latex']

language en_US.utf8
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
set shortmess+=Ia
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/temp
set colorcolumn=0
set confirm
set cursorline
set directory=~/.vim/temp
set display+=lastline
set encoding=utf-8
set expandtab
set exrc
set foldmethod=marker
set foldnestmax=2
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
set norelativenumber
set noshowmatch		" cursor no jumps to parent bracket
set nosmarttab
set nospell
set noswapfile
set novisualbell
set nowritebackup
set number
set path+=**
set ruler
set scrolloff=7
set secure
set shiftwidth=2
set sidescrolloff=5
set smartcase
set smartindent
" set spell
set tabstop=2
set textwidth=0
set title
set undodir=~/.vim/temp
set wildmenu
set wrap

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
" let g:user_emmet_leader_key='<c-,>'
"
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

command! ClearDebug :g/* debugging-console */d 
command! Conf source ~/.vimrc
command! Font Guifont DejaVu\ Sans\ Mono:h15
command! SortWords call setline('.', join(sort(split(getline('.'), ' ')), " "))
command! Vifmrc tabe ~/.config/vifm/vifmrc
command! Vimrc tabe ~/dotfiles/.vimrc
command! Zshrc tabe ~/dotfiles/.zshrc
imap <c-,> <c-y>,jk
inoremap [<cr> [<cr>]<esc>O
inoremap [<space> [  ]<left><left>
inoremap jk <esc>
inoremap {<cr> {<cr>}<esc>O
inoremap {<space> {  }<left><left>
nmap <c-,> <c-y>,
nmap <leader>f <Plug>(easymotion-s)
nmap ба <Plug>(easymotion-s)
nmap <leader>t <Plug>(easymotion-bd-jk)
nmap бе <Plug>(easymotion-bd-jk)
nnoremap : ;
nnoremap ; :
" nnoremap q; q:
" nnoremap q: q;
nnoremap <Down> j<c-e>
" nnoremap <F5> :Conf<cr>
nnoremap <Up> k<c-y>
nnoremap <backspace> i<backspace><esc>l
nnoremap <enter> i<enter><esc>l
nnoremap <leader>. :b
nnoremap <leader>1 :b 1<cr>
nnoremap <leader>2 :b 2<cr>
nnoremap <leader>3 :b 3<cr>
nnoremap <leader>4 :b 4<cr>
nnoremap <leader>5 :b 5<cr>
nnoremap <leader>6 :b 6<cr>
nnoremap <leader>7 :b 7<cr>
nnoremap <leader>8 :b 8<cr>
nnoremap <leader>9 :b 9<cr>
nnoremap <silent> <esc> :noh<cr>
nnoremap <silent> <leader>c, :call ToggleEndChar(',')<cr>
nnoremap <silent> <leader>c; :call ToggleEndChar(';')<cr>
nnoremap <silent> <leader>l :Buffers<cr>
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]W <Plug>(ale_last)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap <space> i<space><esc>l
nnoremap vv ggVG
noremap <silent> <F6> :GundoToggle<cr>
noremap <silent> <F7> :NERDTreeToggle<cr>
noremap <silent> <F8> :TagbarToggle<cr>
vnoremap : ;
vnoremap ; :

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
  " colorscheme dracula
  colorscheme gruvbox
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

" se grepprg=ack\ --nogroup\ $*
se grepprg="grep -R"
se grepformat=%f:%l:%c:%m

se fileformat=unix

inoremap ;w <esc>:w<cr>

" not relevant now
" nnoremap <F1> :se ft=javascript.jsx<cr>
" nnoremap <F2> :se ft=jsx<cr>
" inoremap <F1> <esc>:se ft=javascript.jsx<cr>a
" inoremap <F2> <esc>:se ft=jsx<cr>a

" set guifont=Monospace\ Regular\ 14
set guifont=DroidSansMono\ Nerd\ Font\ 15

nnoremap <leader>w <Plug>GenerateDiagram
" nnoremap <unique> <leader>w :echo "done"

nnoremap <silent> : :Buffers<cr>
nnoremap <silent> <C-x>b :Gblame<cr>
nnoremap <silent> <C-x>l :Files<cr>
nnoremap <silent> <C-p> :GFiles<cr>
nnoremap <silent> <C-x>h :vs<cr>:Files<cr>
nnoremap <silent> <C-x>f :NERDTreeFind<cr>

nnoremap <silent> <C-x>p :Prettier<cr>

nnoremap <silent> <C-x>s :Gstatus<cr>

nnoremap <leader>w :w<cr>
inoremap <leader>w :w<cr>l


" localization for ukrainian language
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz
" inoremap ол <esc>
nnoremap Ж ;
nnoremap ж :
vnoremap Ж ;
vnoremap ж :
cnoremap ц w
cnoremap й q
cnoremap ч x
cnoremap ф a
" cnoremap ч x
" cnoremap ч x
nnoremap Є "




























  " nnoremap й q
  " nnoremap ц w
  " nnoremap у e
  " nnoremap к r
  " nnoremap е t
  " nnoremap н y
  " nnoremap г u
  " nnoremap ш i
  " nnoremap щ o
  " nnoremap з p
  " nnoremap х [
  " nnoremap ї ]
  " nnoremap ґ \
  " nnoremap ф a
  " nnoremap і s
  " nnoremap в d
  " nnoremap а f
  " nnoremap п g
  " nnoremap р h
  " nnoremap о j
  " nnoremap л k
  " nnoremap д l
  " nnoremap ж ;
  " nnoremap є '
  " nnoremap я z
  " nnoremap ч x
  " nnoremap с c
  " nnoremap м v
  " nnoremap и b
  " nnoremap т n
  " nnoremap ь m
  " nnoremap б ,
  " nnoremap ю .
  " nnoremap .  /
  " nnoremap Й Q
  " nnoremap Ц W
  " nnoremap У E
  " nnoremap К R
  " nnoremap Е T
  " nnoremap Н Y
  " nnoremap Г U
  " nnoremap Ш I
  " nnoremap Щ O
  " nnoremap З P
  " nnoremap Х [
  " nnoremap Ї ]
  " nnoremap Ґ \
  " nnoremap Ф A
  " nnoremap І S
  " nnoremap В D
  " nnoremap А F
  " nnoremap П G
  " nnoremap Р H
  " nnoremap О J
  " nnoremap Л K
  " nnoremap Д L
  " nnoremap Ж :
  " nnoremap Є "
  " nnoremap Я Z
  " nnoremap Ч X
  " nnoremap С C
  " nnoremap М V
  " nnoremap И B
  " nnoremap Т N
  " nnoremap Ь M
  " nnoremap Б <
  " nnoremap Ю >
  " nnoremap ,  ?






nnoremap <silent> <C-j> :ALENext<cr>
nnoremap <silent> <C-k> :ALEPrevious<cr>

let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'

nnoremap <silent> <C-x>r :Rg<cr>
nnoremap <silent> <leader>q :q<cr>

nnoremap ! :!
nnoremap <c-x>a :!git add %<cr>
nnoremap <c-x>t :tabe terminal<cr>:terminal<cr><C-\><C-n><C-w>oi

nnoremap <c-w>Q :tabclose<cr>
nnoremap <c-w>O :tabonly<cr>
nnoremap <C-w>t :tabe<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
      \ 'javascript': ['tcp://127.0.0.1:2089'],
      \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
      \ 'typescript': ['tcp://127.0.0.1:2089'],
      \ 'typescript.tsx': ['tcp://127.0.0.1:2089'],
      \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<cr>
" nnoremap <C-]> :call LanguageClient#textDocument_definition()<cr>

" nnoremap <C-1> 1gt
" nnoremap <C-2> 2gt
" nnoremap <C-3> 3gt
" nnoremap <C-4> 4gt
" nnoremap <C-5> 5gt
" nnoremap <C-6> 6gt
" nnoremap <C-7> 7gt
" nnoremap <C-8> 8gt
" nnoremap <C-9> 9gt
" nnoremap <C-0> 0gt
nnoremap <C-1> :tabnext 1<cr>
nnoremap <C-2> :tabnext 2<cr>
nnoremap <C-3> :tabnext 3<cr>
nnoremap <C-4> :tabnext 4<cr>
nnoremap <C-5> :tabnext 5<cr>
" nnoremap <C-6> :tabnext 6<cr>
" nnoremap <C-7> :tabnext 7<cr>
" nnoremap <C-8> :tabnext 8<cr>
" nnoremap <C-9> :tabnext 9<cr>
" nnoremap <C-0> :tabnext 0<cr>

" some tmux stuff
nnoremap gq :q<cr>

nnoremap <F11> :Goyo<cr>

set splitbelow
set splitright

autocmd BufWritePost */.vimrc :Conf

inoremap <silent><expr> <C-n> 
      \ pumvisible() ? "\<C-n>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction


set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

vnoremap y may`a

command! Term :execute "!alacritty --working-directory " . expand('%:p:h') . " &" | normal "kkk"

set runtimepath+=~/dotfiles

" so ~/dotfiles/localization-ukr.vim

set clipboard+=unnamedplus

autocmd BufRead,BufNewFile ~/master-thesis/*.tex setlocal ts=4 sw=4 tw=0 noet ft=tex

abbrev сдф CLA

nnoremap о gj
nnoremap л gk
nnoremap по j
nnoremap пл k
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap ʼ ~
nnoremap ЮЮ >>
nnoremap ББ <<
vmap І S
vmap Х {
vmap Ї }

set scrolloff=0

nnoremap <F5> :make build<cr>

nnoremap <F1> :ALEDetail<cr>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gs :G<cr>

hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow
