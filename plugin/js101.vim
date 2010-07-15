"if exists("g:loaded_js101")
  "finish
"endif
" sudo apt-get install spedermonkey-bin
" set js path 
let s:path = expand('~/.vim/plugin/js/')
" jslint temp file path 
let s:temp_jslint=s:path.'.jslint_temp'
"format javascript
fun! FormatJs()
  normal mp
  execute "%!cat > /tmp/jsbeautify |js ~/.vim/plugin/js/runbeautify.js"
  normal `p
endfun
"run jslint
fun! JSLint()
 "silent execute "silent !cat % |js ".s:path."runjslint.js % ".s:path." > ".s:temp_jslint
 silent execute "!echo %:p > /tmp/jslintfile"
 silent execute "!cat % > /tmp/jslint |js ~/.vim/plugin/js/runjslint.js >".s:temp_jslint
 silent execute "silent cf ".s:temp_jslint
 botright cw
 execute "normal \<c-l>"
endfun

let g:loaded_js101='loaded'
