if exists("b:current_syntax")
	finish
endif
let b:current_syntax="note"

"echom "Cyc Notevim "
"key word
syntax keyword noteKeyword to times
syntax keyword noteKeyword if elseif else
syntax keyword noteKeyword class return
syntax match noteKeyword "\vQ:"
syntax match noteKeyword "\vA:"
syntax match noteKeyword "\v\="
highlight link noteKeyword Keyword

"function 
syntax keyword noteFunction print join string int float
highlight link noteFunction Function	

"string
syntax region noteString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link noteString String

"english word
syntax match engWord "\v[_a-zA-Z]+"
highlight link engWord Keyword

"comment
syntax match noteComment "\v#.*$"
highlight link noteComment Comment

"operators
syntax match noteOperator "\v\*"
syntax match noteOperator "\v/"
syntax match noteOperator "\v\+"
syntax match noteOperator "\v-"
syntax match noteOperator "\v\?"
syntax match noteOperator "\v\*\="
syntax match noteOperator "\v/\="
syntax match noteOperator "\v\+\="
syntax match noteOperator "\v-\="

highlight link noteOperator Operator

"number test
syntax match noteNumber "^[1-9][0-9]*$"
syntax match noteNumber "^0$"

syntax match noteNumber "^0[xX][0-9a-fA-F]*$"
highlight link noteNumber Number

"highlight  string
syntax region noteString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link noteString String

