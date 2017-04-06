if exists("b:current_syntax")
	finish
endif

echom "Cyc Notevim "
syntax keyword noteKeywork to times
syntax keyword noteKeywork if elseif else
syntax keyword noteKeywork class return
syntax keyword noteKeywork Q A

syntax keyword noteFunction print join string int float


highlight link noteKeywork Keyword
highlight link noteFunction Function	

let b:current_syntax="note"
