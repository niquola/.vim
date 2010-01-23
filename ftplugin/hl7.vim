" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
map <buffer> <tab> /\|<cr>
map <buffer> <c-f> :%s/\\r/\r/g<cr> 
vmap <buffer> <c-f> :'<,'>s/\\r/\r/g<cr> 
