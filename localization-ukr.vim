if exists('g:LoadedLocalizationUkr')
  finish
endif

let g:LoadedLocalizationUkr = 1

let g:CurrentLanguage = 'English'

nnoremap <leader>e :call SwitchToEnglish()<cr>
nnoremap <leader>u :call SwitchToUkrainian()<cr>

function! SwitchToUkrainian() 

  inoremap q й
  inoremap w ц
  inoremap e у
  inoremap r к
  inoremap t е
  inoremap y н
  inoremap u г
  inoremap i ш
  inoremap o щ
  inoremap p з
  imap [ х
  inoremap ] ї
  inoremap \ ґ
  inoremap a ф
  inoremap s і
  inoremap d в
  inoremap f а
  inoremap g п
  inoremap h р
  inoremap j о
  inoremap k л
  inoremap l д
  inoremap ; ж
  inoremap ' є
  inoremap z я
  inoremap x ч
  inoremap c с
  inoremap v м
  inoremap b и
  inoremap n т
  inoremap m ь
  inoremap , б
  inoremap . ю
  inoremap / .
  inoremap Q Й
  inoremap W Ц
  inoremap E У
  inoremap R К
  inoremap T Е
  inoremap Y Н
  inoremap U Г
  inoremap I Ш
  inoremap O Щ
  inoremap P З
  inoremap [ Х
  inoremap ] Ї
  inoremap \ Ґ
  inoremap A Ф
  inoremap S І
  inoremap D В
  inoremap F А
  inoremap G П
  inoremap H Р
  inoremap J О
  inoremap K Л
  inoremap L Д
  inoremap : Ж
  inoremap " Є
  inoremap Z Я
  inoremap X Ч
  inoremap C С
  inoremap V М
  inoremap B И
  inoremap N Т
  inoremap M Ь
  inoremap < Б
  inoremap > Ю
  inoremap ? ,

  inoremap jk <esc>

  echo "Switched to: Ukrainian"
endfunction

function! SwitchToEnglish() 

  iunmap q
  iunmap w
  iunmap e
  iunmap r
  iunmap t
  iunmap y
  iunmap u
  iunmap i
  iunmap o
  iunmap p
  iunmap [
  iunmap ]
  iunmap \
  iunmap a
  iunmap s
  iunmap d
  iunmap f
  iunmap g
  iunmap h
  iunmap j
  iunmap k
  iunmap l
  iunmap ;
  iunmap '
  iunmap z
  iunmap x
  iunmap c
  iunmap v
  iunmap b
  iunmap n
  iunmap m
  iunmap ,
  iunmap .
  iunmap /
  iunmap Q
  iunmap W
  iunmap E
  iunmap R
  iunmap T
  iunmap Y
  iunmap U
  iunmap I
  iunmap O
  iunmap P
  iunmap [
  iunmap ]
  iunmap \
  iunmap A
  iunmap S
  iunmap D
  iunmap F
  iunmap G
  iunmap H
  iunmap J
  iunmap K
  iunmap L
  iunmap :
  iunmap "
  iunmap Z
  iunmap X
  iunmap C
  iunmap V
  iunmap B
  iunmap N
  iunmap M
  iunmap <
  iunmap >
  iunmap ?

  iunmap jk

  echo "Switched to: English"
endfunction
