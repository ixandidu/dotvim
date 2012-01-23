set guioptions=maxhorz,maxvert

set guioptions-=T " hide toolbar
set guioptions-=r " hide right scrollbar
set guioptions-=l " hide right scrollbar
set guioptions+=aAce

if $VIM =~ '.app'
  set transparency=10
endif

"set lines=55 columns=87
"set lines=55 columns=180

" increase line height
set linespace=3

set cursorline
" hi CursorLine guifg=#000000

if $VIM =~ '.app'
  "set guifont=Monaco:h10
  set guifont=Inconsolata:h12
  "set guifont=DejaVu\ Sans\ Mono:h13
else
  set guifont=Monospace 8
  "set guifont=Inconsolata\ 8
endif

" highlight column after the value of `textwidth` setting
if has("syntax") && $VIM =~ '/Application'
  set colorcolumn=+1 ",+2,+3,+4,+5,+6,+7,+8,+9,+10
  hi ColorColumn guibg=#323232 guifg=#DA4938
endif

if has("autocmd")
  "autocmd BufWritePost .gvimrc source $MYVIMRC
  autocmd BufWritePost .gvimrc source $MYGVIMRC
endif

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
