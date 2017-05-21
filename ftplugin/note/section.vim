function! s:NextSection(type,backwards)
	if a:type == 1
"		let pattern='one'
		let pattern='\v(\n\n^\s|%^)'
		let flags='e'
	elseif a:type==2
"		let pattern='tow'
		let pattern='\v^\s.*\=.*:$'
		let flags=''
	endif

	if a:backwards
		let dir='?'
	else
		let dir='/'
	endif
	execute 'silent normal! '. dir .pattern.flags. "\r"
endfunction

noremap <script> <buffer> <silent> ]]
   		\:call <SID>NextSection(1,0)<cr>
noremap <script> <buffer> <silent> [[
   		\:call <SID>NextSection(1,1)<cr>
noremap <script> <buffer> <silent> ][
   		\:call <SID>NextSection(2,0)<cr>
noremap <script> <buffer> <silent> []
			\:call <SID>NextSection(2,1)<cr>

