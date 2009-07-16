" map g<number> to bookmarks
let i = 0 
while i < 10 
  execute "nmap <buffer> g".i." ".i."gb" 
  let i += 1
endwhile
