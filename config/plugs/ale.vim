let g:ale_linters_explicit = 1      " Only run linters named in ale_linters settings.
let g:ale_open_list        = 1
let g:ale_list_window_size = 5      " Show 5 lines of errors (default: 10)
let g:ale_set_balloons     = 0
"let g:ale_set_highlights   = 0      " Disabling highlighting

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter        = 0
