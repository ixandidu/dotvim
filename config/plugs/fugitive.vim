if has("fugitive#statusline")
  augroup AutoCleanFugitiveBuffers
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
  augroup END

  " Add git branch to status line
  set statusline+=%{substitute(matchstr(fugitive#statusline(),'(.*)'),'[()]','\ ','g')}
endif
