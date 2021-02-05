call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'rafcamlet/nvim-luapad'

Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-plug'
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

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'tc50cal/vim-terminal'
Plug 'junegunn/limelight.vim'
Plug 'metakirby5/codi.vim'
Plug 'wincent/vcs-jump'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
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
let g:ranger_map_keys = 0
map ,f <Plug>(easymotion-bd-f)
nnoremap ! :!
nnoremap <C-w>t :tabe<cr>
nnoremap <Down> j<c-e>
nnoremap <F11> :Goyo<cr>
nnoremap <Up> k<c-y>
nnoremap <backspace> i<backspace><esc>l
nnoremap <silent> <c-w>O :tabonly<cr>
nnoremap <c-w>Q :tabclose<cr>
nnoremap <c-x>a :!git add %<cr>
nnoremap <enter> i<enter><esc>l
nnoremap <leader>, ,
nnoremap <silent> <C-x>b :Gblame<cr>
nnoremap <silent> <C-x>f :NERDTreeFind<cr>
nnoremap <silent> <C-l> :Buffers<cr>
nnoremap <silent> \s :Snippets<cr>
nnoremap <silent> \m :Maps<cr>
nnoremap <silent> <C-x>l :Files<cr>
nnoremap <silent> <C-x>p :Prettier<cr>
nnoremap <silent> <Space>p :Prettier<cr>
nnoremap <silent> <C-x>s :Gstatus<cr>
nnoremap <silent> <esc> :noh<cr>
nnoremap <silent> <leader>? :ALEDetail<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>
nnoremap <silent> <leader>l :Buffers<cr>
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> ]W <Plug>(ale_last)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap vv ggVG
noremap <silent> <F6> :GundoToggle<cr>
noremap <silent> <F7> :NERDTreeToggle<cr>
noremap <silent> <F8> :TagbarToggle<cr>
vnoremap y may`a

let $FZF_DEFAULT_COMMAND = "fd --ignore-case --hidden --type f --exclude .git"
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"
" let g:UltiSnipsExpandTrigger = "<Space><Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-P>"
let g:UltiSnipsJumpForwardTrigger = "<C-N"
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
command! Vimrc tabe ~/.vimrc
command! Zshrc tabe ~/.zshrc

command! ClearReg exec ClearRegisters('1234567890abcdefgjihklmnoprstufxyz*"=-+.:%/')
function! ClearRegisters(regs)
  let registers = split(a:regs, '\zs')
  for r in registers
    call setreg(r, [])
  endfor
endfunction

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
let g:coc_config_home="~/dotfiles/rubbish-bin"

autocmd BufWritePost */.vimrc :Conf

hi CursorLine ctermbg=232

colorscheme gruvbox

" inoremap [<cr> [<cr>]<esc>O
" inoremap [<space> [  ]<left><left>
" inoremap {<cr> {<cr>}<esc>O
" inoremap {<space> {  }<left><left>

" nmap <leader>gd <Plug>(coc-definition)
" nmap <leader>gr <Plug>(coc-references)
" nmap <leader>gs :G<cr>

" command! LU :w || source ~/test/vim/test.lua

" lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }

se completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']

let g:NERDTreeMinimalUI = 1

nmap <silent> * :let @/='\v<'.expand('<cword>').'>'<cr>:let v:searchforward=1<cr>n
nmap <silent> # :let @/='\v<'.expand('<cword>').'>'<cr>:let v:searchforward=0<cr>n
nmap <silent> g* :let @/='\v'.expand('<cword>')<cr>:let v:searchforward=1<cr>n
nmap <silent> g# :let @/='\v'.expand('<cword>')<cr>:let v:searchforward=0<cr>n

let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1

nnoremap <space>f <Plug>(easymotion-bd-f)
" map <space>s :Snippets<cr>
nnoremap <space>t :let $VIM_DIR=expand('%:p:h')<cr>:terminal<cr>icd $VIM_DIR && clear<cr>

" let g:fzf_preview_window='right:60%'

tnoremap <C-j><C-k> <C-\><C-n>
" tnoremap <C-d> <C-d><cr>
tnoremap <C-d> <C-d><cr>
nnoremap \r :reg<cr>
nnoremap <silent> \c :CocCommand document.renameCurrentWord<cr>
" nnoremap <silent> <space>c :CocCommand<cr>
nnoremap <silent> <space>c :Commands<cr>
let g:limelight_conceal_ctermfg = 'gray'

inoremap ,x <esc>:w<cr>:so %<cr>
nnoremap ,x :w<cr>:so %<cr>
nnoremap ,gs :Gstatus<cr>



let g:startify_custom_header = []
" Max line length that prettier will wrap on: a number or 'auto' (use
" textwidth).
" default: 'auto'
let g:prettier#config#print_width = 80

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 2

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'false'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown or empty string
" (let prettier choose).
" default: ''
let g:prettier#config#parser = ''

" cli-override|file-override|prefer-file
" default: 'file-override'
let g:prettier#config#config_precedence = 'file-override'

" always|never|preserve
" default: 'preserve'
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" default: 'css'
let g:prettier#config#html_whitespace_sensitivity = 'css'

" false|true
" default: 'false'
let g:prettier#config#require_pragma = 'false'

" Define the flavor of line endings
" lf|crlf|cr|all
" defaut: 'lf'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')

" nnoremap <silent> <leader><C-]> :ALEGoToDefinition<cr>
nnoremap <silent> <C-]> :ALEGoToDefinition<cr>

nnoremap <silent> <space>g :GFiles?<cr>
nnoremap <silent> <space>l :Buffers<cr>
nnoremap <silent> <space>s :Files<cr>
nnoremap ,gv `[v`]h
