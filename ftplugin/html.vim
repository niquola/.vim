"setlocal ts=2 "dojo use tabs for indentation
"map <buffer> <c-f> :call FormatJs()<cr>
"map <buffer> <F5> :!js %<cr>
"map <silent> <buffer> <F4> :call JSLint()<cr>
" mp:%!js /home/nicola/.vim/plugin/runbeautify.js<cr>`p  
" set =cat\ %\ \\\|\ js\ /home/nicola/.vim/plugin/runjslint.js\ %
" cabbr jsl !cat % \| js /home/nicola/.vim/plugin/runjslint.js %
" set errorformat=%f:%l:%c:%m

function! Opentestpage()
ruby << EOF
    buf= VIM::Buffer.current
    path=buf.name.split('public')[1]
    url="localhost:3000/#{path}"
    `firefox -new-tab #{url}` unless path.nil?
    VIM::message "Open firefox on #{url}"
EOF
endfunction

"nmap \fo :!firefox -new-tab %<cr> 
nmap <buffer> \fo :call Opentestpage()<cr>

function! FormatHTML()
ruby << EOF
  VIM.command 'normal mygg=G`y'
EOF
endfunction

vmap \fm   :!js ~/.vim/plugin/js/runbeautify.js ~/.vim/plugin/js/<cr>
" for dojo templates

setlocal makeprg=xmllint
map <F4> :make %<cr>cw<cr>
map <silent> <buffer> <F4> :make %<cr>:botright cw<cr>
