function! DojoBaseName()
  let class = substitute(expand('%:t'),'.js','','')
  let dir =  expand('%:p:h')
  let base =  split(dir,'src/')[0].'src/'
  let path =  split(dir,'src/')[1]
  let root_module = split(path,'/')[0] 
  let module =split(path,root_module)[0]
  exec 'e  '.base.root_module.module.'/templates/'.class.'.html' 
endfunction
