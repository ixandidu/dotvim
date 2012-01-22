" Based on
runtime colors/xoria256.vim

let g:colors_name = "xndd"

hi Normal       ctermfg=NONE guifg=#f6f3e8    ctermbg=NONE      guibg=black    cterm=NONE gui=NONE
hi Visual       ctermfg=NONE guifg=NONE       ctermbg=darkgray  guibg=#262D51

hi NonText      ctermfg=0    guifg=#646464    ctermbg=None      guibg=None
hi SpecialKey   ctermfg=0    guifg=#646464    ctermbg=None      guibg=None
hi LineNr       ctermfg=7    guifg=#999999    ctermbg=0         guibg=#323232

" highlight trailing whitespace, tab characters, and text at column > 80
hi XnddUtils ctermbg=0 ctermfg=7 guibg=#323232 "guifg=#000000
match XnddUtils /\s\+$\|\t\+\|\%>80v/
" 	example of tab and trailing whitespaces     
" example of line that exceed more that 80 column 1 2 3 4 5 6 7 8 9 0 11 12 13 14 15

