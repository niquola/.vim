"if (exists("b:folded"))
  "finish
"endif
"let b:folded = 1
"call Foldsearch("")
"compiler ruby

fun! SyntaxRb()
 silent make %
 botright cw
 execute "normal \<c-l>"
endfun
map <buffer> <F4> :call SyntaxRb()<cr>
