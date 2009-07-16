" vim integration with psql
" read db from first line
fun! s:get_db()
 let s:db=(split(getline(1),":"))[1]
 return s:db
endfun

fun! PsqlLine()
 let s:db=s:get_db()
 normal $
 let s:start_pos = search('{{{','bcnW')
 let s:end_pos = search('}}}','cnW')
 if s:start_pos!=0 && s:end_pos!=0
   let s:cmd= ':'.s:start_pos.','.s:end_pos.'w !psql '.s:db.' > ~/temp/sqlres'
   "echo cmd
   exec s:cmd 
   ped ~/temp/sqlres
 endif
endfun

fun! PsqlPW()
 let s:db=s:get_db()
 exec 'w !psql '.s:db.' > ~/temp/sqlres'
 ped ~/temp/sqlres
endfun
