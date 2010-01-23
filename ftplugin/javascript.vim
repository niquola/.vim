setlocal ts=2 "dojo use tabs for indentation
map <buffer> <c-f> :call FormatJs()<cr>
map <buffer> <F5> :!js %<cr>
map <silent> <buffer> <F4> :call JSLint()<cr>
" mp:%!js /home/nicola/.vim/plugin/runbeautify.js<cr>`p  
" set =cat\ %\ \\\|\ js\ /home/nicola/.vim/plugin/runjslint.js\ %
" cabbr jsl !cat % \| js /home/nicola/.vim/plugin/runjslint.js %
" set errorformat=%f:%l:%c:%m
iabbr fnc function(){}<esc>3h
iabbr lfnc function(){console.log(arguments);}
iabbr clg console.log()<esc>1h
iabbr mth prop : function(){<cr>}<esc>?<cr>

command! -buffer H call OpenDijitTemplate()
command! -buffer T call OpenTestFile()
command! -buffer C call OpenCodeFileFromTest()
command! -buffer S call OpenCssFile()
