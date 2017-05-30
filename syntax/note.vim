if exists("b:current_syntax")
	finish
endif
let b:current_syntax="note"

"reference from desert.vim
"define highlight groups
highlight MainTitleTag guifg=magenta gui=none ctermfg=magenta 
highlight TitleTag ctermbg=Black ctermfg=Cyan guifg=Red
highlight DefineWord guifg=magenta guibg=bg ctermfg=gray
highlight Attentions guifg=yellow
highlight WebLink gui=underline  guifg=SeaGreen guibg=bg
highlight EnglishWord guifg=goldenrod guibg=bg
highlight QuestionGroup guifg=springgreen guibg=bg
highlight TipsGroup guifg=magenta guibg=bg
highlight CategoryGroup guifg=Blue guibg=bg

"echom "Cyc Notevim "
"key word
"syntax keyword noteKeyword to times
"syntax keyword noteKeyword if elseif else


"function 
syntax keyword noteFunction print join string int float def if else
highlight link noteFunction Function	

"string
syntax region noteString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link noteString String



"comment
syntax match noteComment "\v# .*$"
syntax match noteComment "\v\" .*$"
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

"common program key words
syntax keyword programKeyword import from 
"as few as possible
syntax match programKeyword "\v\*.{-}\*"
highlight link programKeyword Keyword

"highlight  string
"syntax region noteString start=/\v"/ skip=/\v\\./ end=/\v"/
"highlight link noteString String

"english word
syntax match engWord "\v[_a-zA-Z]+"
highlight link engWord EnglishWord

"*Keyword*
syntax match noteKeyword "\v\*[_a-zA-Z0-9]+\*"
highlight link noteKeyword DefineWord

"*...   CategoryGroup
syntax match categoryGroup "\v^\s*\..*$"
highlight link categoryGroup CategoryGroup


"[Keyword]
syntax match noteKeyword "\v\[[_a-zA-Z0-9]+\]"
highlight link noteKeyword DefineWord

"title tag match
syntax match mainTitleTag "\v^[0-9]+\..*$"
highlight link mainTitleTag MainTitleTag

syntax match titleTag "\v^.*:$"
syntax match titleTag "\v^.*：$"
syntax match titleTag "\v.*:"
syntax match titleTag "\v.*："
highlight link titleTag TitleTag

"web link
syntax match webLink "\vhttp:.*$"
syntax match webLink "\vhttps:.*$"
highlight link webLink WebLink

"tips group define
syntax match tipsGroup "\v^:.*$"
syntax match tipsGroup "\v^ +[0-9]+\..*$"
highlight link tipsGroup TipsGroup

"defind question answer group
syntax match questionGroup "\v^[qQ]:"
syntax match questionGroup "\v[aA]:"
syntax match questionGroup "\v\="
highlight link noteKeyword QuestionGroup
