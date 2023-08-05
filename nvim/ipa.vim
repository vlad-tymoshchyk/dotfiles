let g:IPAOn=0

function! ToggleIPA()
	if !g:IPAOn
		call IPA()
	else
		call IPAOff()
	endif
endfunction

function! IPA()
	echo "IPA macros activated"
	let g:IPAOn=1
	imap ,em ˈ
	imap ,lem ˌ
	imap ,eu ə
	imap ,ng ŋ
	imap ,sh ʃ
	imap ,zh ʒ
	imap ,ph ɸ
	imap ,bh β
	imap ,th θ
	imap ,dh ð
	imap ,vv ʋ
	imap ,uu ʊ
	imap ,eh ɛ
	imap ,oe œ
	imap ,au ɔ
	imap ,ae æ
	imap ,aa ɐ
	imap ,ah ɑ
	imap ,ba ɒ
	imap ,aa ʌ
endfunction

function! IPAOff()
	echo "IPA macros off."
	let g:IPAOn=0
	iunmap ,nn
	iunmap ,gn
	iunmap ,ng
	iunmap ,'
	iunmap ,sh
	iunmap ,zh
	iunmap ,xi
	iunmap ,zi
	iunmap ,ph
	iunmap ,bh
	iunmap ,th
	iunmap ,dh
	iunmap ,cc
	iunmap ,jj
	iunmap ,gh
	iunmap ,xx
	iunmap ,fr
	iunmap ,HH
	iunmap ,hh
	iunmap ,vv
	iunmap ,er
	iunmap ,fl
	iunmap ,bb
	iunmap ,ih
	iunmap ,ii
	iunmap ,eu
	iunmap ,uu
	iunmap ,uh
	iunmap ,eh
	iunmap ,oe
	iunmap ,au
	iunmap ,ae
	iunmap ,aa
	iunmap ,OE
	iunmap ,ah
	iunmap ,ba
endfunction
