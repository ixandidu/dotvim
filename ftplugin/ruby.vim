setlocal textwidth=80

" Automatically fold comments
setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^\\s*#'

" Make those debugger statements painfully obvious
augroup HighlightDebugStatements
  autocmd!
  autocmd BufEnter *.rb,*.rake,*.ru
    \ syntax match error "\<\(binding.pry\|debugger\|puts\|pp\|p\)\>"
augroup END

let b:ale_linters = [
  \ 'rails_best_practices',
  \ 'rubocop',
  \ 'ruby'
\ ]
