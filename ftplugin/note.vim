"nnoremap <leader>t :set operatorfunc=GeneraTagMark<cr>g@
nnoremap <leader>t :call InsertTagMark()
vnoremap <leader>t :<c-u>call GeneraTagMark(visualmode())<cr>

function! InsertTagMark()
	silent execute "silent normal! i\*\<esc>ea\*\<esc>"
endfunction
"frome current mode:cha,v
"Generate Label Mark
function! GeneraTagMark(type)
	let saved_unnamed_register=@@
	"get current mode
	"if visual mode
	echom "get type:".a:type
	if a:type ==#'v'	
		normal! `<v`>y
	elseif a:type==# 'char'
		normal! `[v`]y
	else
		return
	endif
	"check whether string is already a label
	let str=@@
	let @@=saved_unnamed_register
	echom "get string:".str
	if IsLabel(str)
		return
	else
		if a:type ==#'v'	
			normal! `<i"<esc>`>a"<esc>
		elseif a:type==# 'char'
			normal! `[i"<esc>`]a"<esc>
		else
			return
		endif
	endif
	"insert  make string match label mark
endfunction

"check whether current is already a label
function! IsLabel(str)
	return 0
endfunction
