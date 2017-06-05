"setlocal foldmethod=indent
"setlocal foldignore=
"
setlocal foldmethod=indent
" setlocal foldmethod=expr
"setlocal foldexpr=<SID>GetNoteFold(v:lnum)
setlocal foldexpr=GetNoteFold(v:lnum)
"setlocal foldexpr=<SID>GetNoteFold<cr>g@

function! s:GetNoteFold(lnum)
	"space line
	"-1 mean's undefine
	if getline(a:lnum) =~?'\v^\s*$'
		return -1
	endif

	let this_indent=IndentLevel(a:lnum)
	let next_indent=IndentLevel(NextNonBlackLine(a:lnum))

	if next_indent == this_indent
		return this_indent
	elseif next_indent<this_indent
		return this_indent
	elseif next_indent>this_indent
		return '>' . next_indent
	endif
endfunction

function! IndentLevel(lnum)
	" fold level divide shiftwidth
	return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlackLine(lnum)
	" file's total line num
	let numlines=line('$')

	"next line's line num
	let current=a:lnum+1

	while current<=numlines
		" \s mean's space character
		"mean's none space character return
		"jump space lines
		if getline(current) =~? '\v\s'
			return current
		endif

		let current+=1
	endwhile

	"not has result
	return -2
endfunction

