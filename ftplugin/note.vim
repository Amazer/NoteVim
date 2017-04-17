"nnoremap <leader>t :set operatorfunc=GeneraTagMark<cr>g@
nnoremap <leader>t :call InsertTagMark()<cr>
vnoremap <leader>t :<c-u>call GeneraTagMark(visualmode())<cr>
"vnoremap <leader>t :<c-u>call InsertTagMarkVMode()<cr>

vnoremap <leader>r :<c-u>call RemoveTagMark(visualmode())<cr>
nnoremap <leader>r :call RemoveTagMark_Normal()<cr>

function! RemoveTagMark_Normal()
    "use match remove?
    ":'<,'>s/\%V(/#/g
    let str=expand("<cWORD>")
    if IsLabel(str)
        echom "is label true"
        normal! /expand("<cWORD>")
        normal! '<dl\<esc>
        normal! '>dl\<esc>
    endif
        
endfunction
function! RemoveTagMark(type)
	let saved_unnamed_register=@@
	"get current mode
	if a:type ==#'v'	
		normal! `<v`>y
	elseif a:type==# 'char'
		normal! `[v`]y
	else
		return
	endif
	"check whether string is already a label
	let str=@@
	if IsLabel(str)
		if a:type ==#'v'	
            echom "remove tag v mode:"
            echom match(str,"\*.+\*")
"            execute "normal! '<,'>s//\%V\*/\s/g"
            normal! '<,'>s/\%V\*/#/g
		elseif a:type==#'char'
            echom "char mode"
            normal! '<,'>s/\%V\*//g
		endif
    endif
	let @@=saved_unnamed_register
	"insert  make string match label mark
endfunction

function! InsertTagMark()
"    echom "cword:".expand("<cWORD>")
    let str=expand("<cWORD>")
    if IsLabel(str)
        return
    else
	    silent execute "silent normal! i\*\<esc>ea\*\<esc>"
    endif
endfunction

"frome current mode:cha,v
"Generate Label Mark
function! GeneraTagMark(type)
	let saved_unnamed_register=@@
	"get current mode
	if a:type ==#'v'	
		normal! `<v`>y
	elseif a:type==# 'char'
		normal! `[v`]y
	else
		return
	endif
	"check whether string is already a label
	let str=@@
    let @f="*".str."*"
	if IsLabel(str)
		return
	else
		if a:type ==#'v'	
            echom "v mode"
            "运行两条命令
            "第一条，在选中的末尾添加一个*
            "第二条，在选中的开头插入一个*
            execute "normal! `>a*"
            execute "normal! `<i*"
        
"			normal! `>a*
"			normal! `<i*
		elseif a:type==#'char'
            echom "char mode"
            execute "normal! `>a*"
            execute "normal! `<i*"
		endif
    endif
	let @@=saved_unnamed_register
	"insert  make string match label mark
endfunction

"check whether current is already a label
function! IsLabel(str)
    "match will return the match item's index
    "if not math ,return -1
    if  match(a:str,"\*.+\*")!=-1
       " echom "already have **"
        return 1
    endif
       " echom "not match **"
	return 0
endfunction
