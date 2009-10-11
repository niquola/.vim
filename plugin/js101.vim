if exists("g:loaded_js101")
  finish
endif
" sudo apt-get install spedermonkey-bin
" set js path 
let s:path = expand('~/.vim/plugin/js/')
" jslint temp file path 
let s:temp_jslint=s:path.'.jslint_temp'
"format javascript
fun! FormatJs()
  normal mp
  execute  "%!js ".s:path."runbeautify.js ".s:path
  normal `p
endfun
"run jslint
fun! JSLint()
 w
 execute "silent !cat % |js ".s:path."runjslint.js % ".s:path." > ".s:temp_jslint
 execute "cf ".s:temp_jslint
 cw
endfun

let g:loaded_js101='loaded'
