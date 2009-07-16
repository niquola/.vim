" Nicolas vimrc
" use za to close/open foldings
set nocp      " nocompatible
colorscheme desert
"  instal font and use it
"  sudo apt-get install xfonts-terminus
set guifont=Terminus\ 14
" highlite line and column
set cursorline 
" set cursorcolumn
set nu
set numberwidth=3
" change color sheme on mode
au InsertLeave * hi CursorLine     guibg=#333333
au InsertEnter * hi CursorLine     guibg=#213333
" set list
" Show $ at end of line and trailing space as ~
set laststatus=2  " Always show status line.
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" подняться в режиме редактирования
set scrolljump=5
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" опуститься в режиме редактирования
set scrolloff=5
" Выключаем надоедливый "звонок"
" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2
set mouse=a " enable mouse
set guioptions=a
set noeb
set novb
set et        " expandtab
"set wm=8      " wrapmargin
set bs=2      " backspace
"set ru        " ruler
set ic        " ignorecase
set is        " incsearch
set scs       " smartcase: override the 'ic' when searching
set shiftwidth=2  " use two spases for intend
set backup
set nowrap
syn on 
filetype plugin indent on
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" im not shure wi need it
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby,eruby set omnifunc=rubycomplete
au! BufRead,BufNewFile *.haml         setfiletype haml 
" buffer maps  2
" save
map <C-S> :w<CR>
map <C-Q> :q<CR>
map <c-tab> :bnext<cr>
map <s-tab> :bprevious<cr>
" clipboard
vmap <C-C> "+y
nmap <C-V> "+gP
" open explorer
map <C-E> :Explore<CR>
" in normal mode space is visual selection 
nmap <Space> :!
"  2}}}
" line manipulation maps  2
" enable eclipse style moving of lines
nmap <M-j> mz:m+<CR>`z==
nmap <M-k> mz:m-2<CR>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
"  2}}}
" F buttons  2
"allow/dis line wrap
map <F2> :cprevious<cr>
map <F3> :cnext<cr>
nmap <s-f> mngg=G`n
"show buffer explorer
map <c-space> \lb
nmap \fo :!firefox -new-tab %<cr> 
" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
" nmap <c-m> :MarksBrowser<cr>
nmap ' `
"fs brousing navigation  
let g:netrw_list_hide='\~$,\~\*$,\.swp$,\.svn'
" automatization  
"open file in firefox
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=mxml
" expand path to search in dojo 
" set path=.,/home/nicola/workspaces/rails/medapp_tahoe/public/dojo/app/**3
" the last string is instructions for vim about this file
" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=4:shiftwidth=4:softtabstop=4:smarttab:shiftround:expandtab
