set statusline=%<                                " truncation point
set statusline+=%#TabLineSel#
set statusline+=\ %t\                            " file name
set statusline+=%#warningmsg#
set statusline+=%#SpellBad#
set statusline+=%*
set statusline+=\ 
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
set statusline+=%{&ff}]                          " file format
set statusline+=%y                               " filetype
set statusline+=%m                               " modified flag
set statusline+=%r                               " read only flag
set statusline+=%=                               " align left
set statusline+=%-14.(%l,%c%V%)                  "
set statusline+=\ %P                             " Percentage
set statusline+=\ 

if has('autocmd')
  if version >= 700
    augroup HighlightStatusLineInInsertMode
      autocmd!
      autocmd InsertEnter * highlight StatusLine ctermfg=235 ctermbg=250
      autocmd InsertLeave * highlight StatusLine ctermbg=235 ctermfg=188
    augroup END
  endif

  "augroup HighlightTabsAndTrailing
  "  au!
  "  " highlight trailing whitespace, tab characters, and text at column > 80
  "  " 	example of tab and trailing whitespaces     
  "  " example of line that exceed more that 80 column 1 2 3 4 5 6 7 8 9 0 11 12 13 14 15
  "  " ----------------------------------------------------------------------
  "  au BufEnter * let w:m2=matchadd('Error', '\s\+$\|\t\+\|\%>80v', -1)
  "augroup END
endif
