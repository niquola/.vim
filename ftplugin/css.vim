command! -buffer C call OpenCodeFileFromCss()
command! -buffer H call OpenTemplateFileFromCss()
map <buffer> <F5> :%!csstidy % --silent=true --template=low --sort_properties=true --compress_font-weight=false --preserve_css=true --sort_selectors=true<cr>
map <buffer> <F4> :!csstidy % -template=low --sort_properties=true --compress_font-weight=false <cr>
