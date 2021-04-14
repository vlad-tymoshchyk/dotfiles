call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'rafcamlet/nvim-luapad'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-plug'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
call plug#end()

set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/temp
set clipboard+=unnamedplus
set colorcolumn=0
set completeopt=longest,menuone
set completeopt=menuone,noinsert,noselect
set confirm
set cursorline
set directory=~/.vim/temp
set display+=lastline
set encoding=utf-8
set expandtab
set exrc
set foldmethod=marker
set foldnestmax=2
" set guifont=DroidSansMono\ Nerd\ Font\ 15
set guifont=JetBrainsMono\ Nerd\ Font\ 15
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
set scrolloff=3
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
map ,f <Plug>(easymotion-bd-f)
nnoremap <C-w>t :tabe<cr>
nnoremap <silent> <c-w>O :tabonly<cr>
nnoremap <c-w>Q :tabclose<cr>
nnoremap <c-x>a :!git add %<cr>
nnoremap <silent> <C-x>b :Gblame<cr>
nnoremap <silent> <C-x>f :call SmartNERDTree()<CR>
function! SmartNERDTree()                   
    if @% == ""
        NERDTreeToggle                      
    else                                    
        NERDTreeFind                        
    endif                                   
endfun
nnoremap <silent> \s :Snippets<cr>
nnoremap <silent> \m :Maps<cr>
nnoremap <silent> <Space>p :Prettier<cr>
nnoremap <silent> <C-x>s :Gstatus<cr>
nnoremap <silent> <esc> :noh<cr>
nnoremap <silent> <leader>? :ALEDetail<cr>
nnoremap <silent> <leader>l :Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> [W <Plug>(ale_first)
nnoremap <silent> ]W <Plug>(ale_last)
nnoremap <silent> [w <Plug>(ale_previous)
nnoremap <silent> ]w <Plug>(ale_next)
nnoremap vv ggVG
noremap <silent> <Space>n :NERDTreeToggle<cr>
vnoremap y may`a

let $FZF_DEFAULT_COMMAND = "fd --ignore-case --hidden --type f --exclude .git --exclude .cache --exclude node_modules"
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"
" let g:UltiSnipsExpandTrigger = "<Tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
" let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-,>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-'>"
" let g:UltiSnipsJumpForwardTrigger = "<c-;>"
let g:indentLine_enabled = 0
let g:snipMate = {}
let g:snipMate.override = 1
let g:ycm_key_list_select_completion = ["<leader><Tab>"]
let g:ycm_key_list_stop_completion = "<esc>"
let mapleader = ","

language en_US.utf8

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
      \   'javascript': ['flow-language-server']
      \}

let g:NERDTreeDirArrowExpandable = "▸"
let g:NERDTreeDirArrowCollapsible = "▾" 

command! Conf source ~/.vimrc
command! Vimrc tabe ~/.vimrc
command! Zshrc tabe ~/.zshrc

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

command! Delete call delete(expand('%')) | bdelete!

let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.txt'
let g:coc_config_home="~/dotfiles/rubbish-bin"
let g:coc_global_extensions=[ "coc-tsserver" ]

autocmd BufWritePost */.vimrc :Conf
" autocmd BufWritePost ~/vim-viml/main.vim :so %

colorscheme gruvbox
" inoremap [<cr> [<cr>]<esc>O
" inoremap [<space> [  ]<left><left>
" inoremap {<cr> {<cr>}<esc>O
" inoremap {<space> {  }<left><left>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gy <Plug>(coc-type-definition)
" nmap <leader>gs :G<cr>

let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
let g:NERDTreeMinimalUI = 1

nmap <silent> * :let @/='\v<'.expand('<cword>').'>'<cr>:let v:searchforward=1<cr>n
nmap <silent> # :let @/='\v<'.expand('<cword>').'>'<cr>:let v:searchforward=0<cr>n
nmap <silent> g* :let @/='\v'.expand('<cword>')<cr>:let v:searchforward=1<cr>n
nmap <silent> g# :let @/='\v'.expand('<cword>')<cr>:let v:searchforward=0<cr>n

let g:NERDTreeHijackNetrw = 1

nnoremap <silent> <space>f :lua require('telescope.builtin').live_grep{}<cr>
tnoremap <C-j><C-k> <C-\><C-n>
tnoremap <C-d> <C-d><cr>
nnoremap <silent> \c :CocCommand document.renameCurrentWord<cr>
nnoremap <silent> <space>c :Commands<cr>
let g:limelight_conceal_ctermfg = 'gray'

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
" nnoremap <silent> <C-]> :ALEGoToDefinition<cr>
" nnoremap <silent> g<C-]> :ALEGoToDefinition<cr>

nnoremap <silent> <space>g :GFiles?<cr>
nnoremap <silent> <space>l :Telescope current_buffer_fuzzy_find<cr>
nnoremap <silent> <space>b :Buffers<cr>
" nnoremap <silent> <space>s :Files<cr>
nnoremap <silent> <space>s :Telescope find_files<cr>
nnoremap ,gv `[v`]h

set runtimepath+=~/dotfiles/
" set runtimepath+=~/test/vim-plugin

" nnoremap gj maJ`a
nnoremap <silent>,ww :w<cr>

let g:NERDDefaultNesting=0

nnoremap <leader>gs :G<cr>
nnoremap <leader>gh :diffget //2<cr>
nnoremap <leader>gl :diffget //3<cr>

autocmd! BufWritePost * :so ~/test/vim-script/test.vim

let g:prettier#config#single_quote = 1

nmap <silent> ĝ w
nmap <silent> ŭ y
nmap <silent> ŝ q
nmap <silent> ĉ x
nmap <silent> ĵ [
nmap <silent> ĥ ]

cabbrev ĝ w
cabbrev ĉ x
cabbrev ŝ q

let g:startify_change_to_dir = 0
nnoremap Ñ :
" set runtimepath+=~/mpc_player/mpc/
" autocmd BufWritePost ~/mpc_player/mpc/plugin/plugin.vim :so %
" autocmd BufWritePost ~/mpc_player/mpc/autoload/mpc.vim :so %
" autocmd BufWritePost ~/mpc_player/mpc/syntax/mpdv.vim :so %

lua require('lspconfig').tsserver.setup{ on_attach=require'completion'.on_attach }

nnoremap ,, ,
nnoremap <silent> \h :Helptags<cr>
nnoremap <silent> \r :Telescope lsp_references<cr>
nnoremap <silent> \a :Telescope lsp_code_actions<cr>
let g:AutoPairsFlyMode=1
let g:AutoPairsCenterLine=0
nnoremap <C-e> <C-w>
nnoremap <C-w> <Nop>
