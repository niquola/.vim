if (exists("b:folded"))
  finish
endif
let b:folded = 1
au Filetype ruby call Foldsearch("")
