set fuoptions=maxhorz,maxvert

set guioptions-=T " hide toolbar
" set guioptions-=r " hide right scrollbar
" set guioptions-=l " hide right scrollbar
" set guioptions+=aAce

set transparency=10

"set lines=55 columns=87
"set lines=55 columns=180

" increase line height
set linespace=3

set cursorline
" hi CursorLine guifg=#000000

colorscheme railscasts

set guifont=Monaco:h10
"set guifont=Bitstream\ Vera\ Sans\ Mono:h10
"set guifont=Inconsolata:h12
"set guifont=DejaVu\ Sans\ Mono:h13

" highlight column after the value of `textwidth` setting
if has("syntax")
  set colorcolumn=+1 ",+2,+3,+4,+5,+6,+7,+8,+9,+10
  hi ColorColumn guibg=#323232 guifg=#DA4938
endif

if has("autocmd")
  "autocmd BufWritePost .gvimrc source $MYVIMRC
  autocmd BufWritePost .gvimrc source $MYGVIMRC
endif

"##############################################################################
" re-declare highlight setting on .vimrc since the colorscheme override it
"##############################################################################
hi NonText    ctermbg=None ctermfg=0 guifg=#646464 " guibg=None
hi SpecialKey ctermbg=None ctermfg=0 guifg=#646464 " guibg=None
"hi LineNr     ctermbg=0    ctermfg=7 guifg=#999999 guibg=#323232
"
" highlight trailing whitespace, tab characters, and text at column > 80
hi XnddUtils ctermbg=0 ctermfg=7 guibg=#323232 "guifg=#000000
match XnddUtils /\s\+$\|\t\+\|\%>80v/
" 	example of tab and trailing whitespaces     
" example of line that exceed more that 80 column 2 2 3 4 5 6 7 8 9 0 11 12 13 14 15
"##############################################################################

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
