"""" Normal Mode """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoindent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Higlight current line and column - because I have bad (cylinder) eyesight
nnoremap <Leader>cl :set cursorline!<CR>
nnoremap <Leader>cc :set cursorcolumn!<CR>

" Scroll binding
nnoremap <Leader>sb :windo set scb!<CR>

" Spell toggle
nmap <silent> <leader>s :set spell!<CR>

" No Help, please
nmap <F1> <Esc>

" Move single line up or downward
nmap <C-j> :m +1 <CR>
nmap <C-k> :m -2 <CR>

" Show highlighting groups for current word - useful for editing themes
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Replace Old RSpec's `should` with `expect`
" eg:
"     response.should render_template(:index) -> expect(response).to render_template(:index)
"
"                             1               2  3                 4
nmap <silent> <leader>re :%s!\(\S\+\)\.should\(_\(not_\?\)\?\)\?\s\?\(receive\\|\S\+\)!expect(\1).\3to \4!<CR>
"                             1                                          2                                                                    3
nmap <silent> <leader>ra :%s!\(\S\+\)\.\%(should_receive\\|stub\)(\?\s\?\(:\w\+[=?!]\?\))\?\%(\.and_\%(return\\|raise\)\\|\s=>\s\?\)\?(\?\s\?\(@\?\"\?\w\+\s\?:\?:\?\w\+\"\?\)\?)\?!allow(\1).to receive(\2) { \3 }!<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Visual Mode """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Duplicate a selection or line
vmap D yea <ESC>p`[v`]
vmap <C-D> yp`[V`]

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Move multiple lines based on selection
vmap <C-j> xp`[V`]
vmap <C-k> xkP`[V`]

" Search some string
" was intended for removing deadweight - search unused methods/css definition.
function! SearchInProject()
  let s:selected_text = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]

  if s:selected_text != ""
    exec "silent grep \"" . s:selected_text . "\" " | copen
  endif

  redraw!
endfunction
vmap <Leader>sa :call SearchInProject()<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Command Line Mode """""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" I always forget using sudo
cmap w!! w !sudo tee % >/dev/null
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Normal, Visual, Select, Operator-pending Model """""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Find and open URL in current line
map <Leader>u :call OpenURL()<CR>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
    echo s:uri
  else
    echo "No URI found in line."
    echo s:uri
  endif
endfunction

"""" Insert Mode """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press ^F from insert mode to insert the current file name
"imap <C-F> <C-R>=expand("%:t")<CR>
imap <C-F> <C-R>=substitute(expand("%:t:r"), "^\\d\\+[ _]", "", "")<CR>
imap <C-C> <C-R>=substitute(substitute(substitute(expand("%:t:r"), "^\\d\\+[ _]", "", ""), "\\(^\\w\\\|\\(_\\)\\w\\)", "\\U\\1", "g"), "_", "", "g")<CR>

" Maps autocomplete to tab
"imap <Tab> <C-N>

imap <C-L> <Space>=><Space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Search for selected text, forwards or backwards
vnoremap <silent> * :<C-U>
  \ let oldReg=getreg('"')<Bar>let oldRegType=getregtype('"')<CR>
  \ gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ gV:call setreg('"', oldReg, oldRegType)<CR>
vnoremap <silent> # :<C-U>
  \ let oldReg=getreg('"')<Bar>let oldRegType=getregtype('"')<CR>
  \ gvy?<C-R><C-R>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ gV:call setreg('"', oldReg, oldRegType)<CR>
