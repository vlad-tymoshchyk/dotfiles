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

nnoremap <F5> :make build<cr>

nnoremap <F1> :ALEDetail<cr>

hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=Red ctermbg=Yellow

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

" so ~/dotfiles/localization-ukr.vim
command! Term :execute "!alacritty --working-directory " . expand('%:p:h') . " &" | normal "kkk"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfunction

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <c-x>t :tabe terminal<cr>:terminal<cr><C-\><C-n><C-w>oi

nnoremap <silent> <C-x>r :Rg<cr>
nnoremap <silent> <leader>q :q<cr>


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

  " if has('win32')
  "   se shell=powershell.exe
  " endif
  " tnoremap <a-h> <c-\><c-n>gT
  " tnoremap <a-l> <c-\><c-n>gt
  " tnoremap <leader>s <c-\><c-n><c-w>W
  " tnoremap <leader>d <c-\><c-n><c-w>w
  " " tnoremap <esc> <c-\><c-n>
  " tnoremap jk <c-\><c-n>
  " tnoremap <leader>q <c-\><c-n>:q<cr>

if has('nvim')
  " colorscheme dracula
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

" vnoremap : ;
" vnoremap ; :
nnoremap <space> i<space><esc>l
" nnoremap <silent> : :Buffers<cr>
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

" nnoremap : ;
" nnoremap ; :
" nnoremap q; q:
" nnoremap q: q;

nmap бе <Plug>(easymotion-bd-jk)
nmap ба <Plug>(easymotion-s)
nmap <c-,> <c-y>,

imap <c-,> <c-y>,jk
