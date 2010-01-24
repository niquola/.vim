"if (exists("b:folded"))
  "finish
"endif
"let b:folded = 1
"call Foldsearch("")
compiler ruby
map <buffer> <F5> :make % <cr>
