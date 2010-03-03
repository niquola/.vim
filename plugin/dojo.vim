function! DojoExtractBaseInfo(file)
  let i ={}
  let i.base =  split(a:file,'src/')[0].'src/'
  let i.path =  split(a:file,'src/')[1]
  let i.root_module = split(i.path,'/')[0].'/' 
  let i.class = split(a:file,'/')[-1]
  let i.module = substitute(i.path,i['root_module'],'','') 
  let i.module = substitute(i.module,'/'.i['class'],'','') 
  return i
endfunction

function! DojoOpenFile(path)
  if filereadable(a:path)
    exec 'e  '.a:path
  else
    echo 'File '.a:path.' not exists'
  endif
endfunction

function! DojoFromCode()
  return DojoExtractBaseInfo(substitute(expand('%:p'),'.js','',''))
endfunction

function! DojoFromTemplate()
  let base = substitute(expand('%:p'),'templates/','','')
  let base = substitute(base,'.html','','')
  return DojoExtractBaseInfo(base)
endfunction

function! DojoFromTestCode()
  let base = substitute(expand('%:p'),'tests/','','')
  let base = substitute(base,'.js','','')
  return DojoExtractBaseInfo(base)
endfunction

function! DojoFromTestPage()
  let base = substitute(expand('%:p'),'tests/','','')
  let base = substitute(base,'.html','','')
  return DojoExtractBaseInfo(base)
endfunction

function! DojoFromStyle()
  let base = substitute(expand('%:p'),'themes/tundra/','','')
  let base = substitute(base,'.css','','')
  return DojoExtractBaseInfo(base)
endfunction

function! Dojo2Template(i)
  let path =  a:i['base'].a:i['root_module'].a:i['module'].'/templates/'.a:i['class'].'.html' 
  call DojoOpenFile(path)
endfunction

function! Dojo2Code(i)
  let path =  a:i['base'].a:i['root_module'].a:i['module'].'/'.a:i['class'].'.js' 
  call DojoOpenFile(path)
endfunction

function! Dojo2TestCode(i)
  let path =  a:i['base'].a:i['root_module'].'tests/'.a:i['module'].'/'.a:i['class'].'.js' 
  call DojoOpenFile(path)
endfunction

function! Dojo2TestPage(i)
  let path =  a:i['base'].a:i['root_module'].'tests/'.a:i['module'].'/'.a:i['class'].'.html' 
  call DojoOpenFile(path)
endfunction

function! Dojo2Style(i)
  let path =  a:i['base'].a:i['root_module'].'themes/tundra/'.a:i['module'].'/'.a:i['class'].'.css' 
  call DojoOpenFile(path)
endfunction

function! DojoGenerateCommands(from)
  let dojoTos=['TestPage','TestCode', 'Code','Style','Template']
  let commandsMap = {'TestPage':'TH','TestCode':'T','Style':'S','Template':'H','Code':'C'}
  for dojoTo in dojoTos 
    exec 'command! -buffer '.commandsMap[dojoTo].' call Dojo2'.dojoTo.'(DojoFrom'.a:from.'())'
  endfor
endfunction

autocmd BufNewFile,BufRead */src/*.js call DojoGenerateCommands('Code') 
autocmd BufNewFile,BufRead */src/*/tests/*.js call DojoGenerateCommands('TestCode') 
autocmd BufNewFile,BufRead */src/*/tests/*.html call DojoGenerateCommands('TestPage') 
autocmd BufNewFile,BufRead */src/*/templates/*.html call DojoGenerateCommands('Template') 
autocmd BufNewFile,BufRead */src/*/tundra/*.css call DojoGenerateCommands('Style') 

autocmd BufRead *.js set includeexpr=substitute(substitute(v:fname,'\\.','/','g'),'"','','')
autocmd BufRead *.js let &path = split(expand('%:p'),'src/')[0].'src/'
autocmd BufRead *.js set suffixesadd=.js
