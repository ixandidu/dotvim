" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"
" Pathogen initialization
call pathogen#infect('bundle/{}')
call pathogen#helptags()


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"
" Swap backup file
" set noswapfile
set nobackup         " Don't make a backup before overwriting a file
set nowritebackup    " And again

set history=50 " keep 50 lines of command line history

"
" My Visual Preference - what I want to visually see.
set ruler     " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch " do incremental searching
"set nowrap    " Switch wrap off for everything
set hidden    " avoid vim warning for unsaved changes when changing buffer
set scrolloff=3     " Show 3 lines of content arround the cursor
set sidescrolloff=5 " Show 5 chars of content arround the cursor
set visualbell " No Beeping
set textwidth=80
" Higlight current line and column - because I have bad (cylinder) eyesight
nnoremap <Leader>cl :set cursorline!<CR>
nnoremap <Leader>cc :set cursorcolumn!<CR>
set cursorline


" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && has('syntax') && !exists("syntax_on")
  syntax on
  set hlsearch
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  "autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist
  autocmd FileType text,markdown setlocal wrap linebreak nolist

  autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn
        \ if &ft =~# '^\%(conf\|modula2\)$' |
        \   set ft=markdown |
        \ else |
        \   setf markdown |
        \ endif

  " taken from: http://dailyvim.tumblr.com/post/1262764095/additional-ruby-syntax-highlighting
  au BufRead,BufNewFile {.simplecov,Guardfile,Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

  " Spell Check for git commit messages
  autocmd FileType gitcommit setlocal spell

  augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
  augroup END

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files, markdown, and ruby set 'textwidth' to 80 characters.
  autocmd FileType text,markdown,ruby setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc,.gvimrc source $MYVIMRC

  " For Haml
  au! BufRead,BufNewFile *.haml         setfiletype haml
  au! BufRead,BufNewFile *.markerb      setfiletype markdown

  augroup END
else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

"if has("folding")
"  set foldenable
"  set foldmethod=syntax
"  set foldlevel=1
"  set foldnestmax=2
"  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
"endif


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Encryption
set cryptmethod=blowfish

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Spell toggle
nmap <silent> <leader>s :set spell!<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" Hide search highlighting
map <Leader>h :set invhls <CR>

" disabble autoindenting when pasting text from clipboard (I never use f2)
" set pastetoggle=<F2>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
"vmap D y'<p

" Duplicate a selection or line
vmap D yea <ESC>p`[v`]
vmap <C-D> yp`[V`]

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
"imap <C-F> <C-R>=expand("%:t")<CR>
imap <C-F> <C-R>=substitute(expand("%:t:r"), "^\\d\\+[ _]", "", "")<CR>
imap <C-C> <C-R>=substitute(substitute(substitute(expand("%:t:r"), "^\\d\\+[ _]", "", ""), "\\(^\\w\\\|\\(_\\)\\w\\)", "\\U\\1", "g"), "_", "", "g")<CR>

" Maps autocomplete to tab
"imap <Tab> <C-N>

imap <C-L> <Space>=><Space>

" Display extra whitespace
"set list listchars=tab:»·,trail:·
"set list listchars=tab:».,trail:.,extends:#,nbsp:.,eol:¬
"set mouse=a

" Use The Silver Searcher instead of Grep when available
if executable("ack")
  set grepprg=ag\ -t\ --nobreak\ --noheading\ --nogroup\ --nocolor\ --ignore-dir\ tmp\ --ignore-dir\ coverage
endif

colorscheme xndd

" Numbers
set number
set numberwidth=5

" only complete to the longest unambiguous match, show a menu, and location
" where we can found the displayed string)
set completeopt=longest,menu,preview
set wildmode=list:longest,list:full
" set completion to (in prioritical order)
" * current buffer
" * loaded buffer that exists in the list (opened one)
" * unloaded buffer that exists in the list (closed one)
" * tag completion (current tags file)
set complete=.,b,u,t

" ignore some file extentions when completing names by pressing tab
set wildignore=*.swp,*.bak,*.pyc,*.class

" case only matters with mixed case expressions
"set ignorecase
"set smartcase

" CTags - you need to install CTags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;


" Open URL
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
map <Leader>w :call OpenURL()<CR>
"command -bar -nargs=1 OpenURL :!open <args>

" Move single line
"nmap <C-k> ddkP
"nmap <C-j> ddp
map <C-j> :m +1 <CR>
map <C-k> :m -2 <CR>
" Move multiple lines based on selection
vmap <C-j> xp`[V`]
vmap <C-k> xkP`[V`]
"vmap <C-j> :m +1 <CR>`[V`]
"vmap <C-k> :m -2 <CR>`[V`]

" Project Tree
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

" If the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  if isdirectory(a:directory)
    call ChangeDirectory(a:directory)
  endif
endfunction

" NERDTree utility function
function! s:UpdateNERDTree(stay)
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      NERDTree
      if !a:stay
        wincmd p
      end
    endif
  endif
endfunction

" Public NERDTree-aware versions of builtin functions
function! ChangeDirectory(dir, ...)
  execute "cd " . a:dir
  let stay = exists("a:1") ? a:1 : 1
  call s:UpdateNERDTree(stay)
endfunction

" Show highlighting groups for current word - useful for editing themes
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" I always forget using sudo
cmap w!! w !sudo tee % >/dev/null


" Search some string in Rails' app folder.
" was intended for removing deadweight - search unused methods/css definition.
function! SearchInApp()
  let s:selected_text = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
  if s:selected_text != ""
    exec "grep! \"" . s:selected_text . "\" app/ vendor/assets/"
  endif
endfunction
vmap <Leader>sa :call SearchInApp()<CR><CR>
"
" TODO: REFACTOR!
function! SearchInSpec()
  let s:selected_text = getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
  if s:selected_text != ""
    exec "grep! \"" . s:selected_text . "\" features/ spec/"
  endif
endfunction
vmap <Leader>ss :call SearchInSpec()<CR><CR>

" Add git branch to status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


" Replace Old RSpec's `should` with `expect`
"
" eg:
"     response.should render_template(:index) -> expect(response).to render_template(:index)
"
"                             1               2  3                 4
nmap <silent> <leader>re :%s!\(\S\+\)\.should\(_\(not_\)\?\)\?\s\?\(receive\\|[\S]*\)!expect(\1).\3to \4!<CR>
nmap <silent> <leader>ra :%s!\(\S\+\)\.\%(should_receive\\|stub\)(\?\s\?\(:\w\+[?\!]\?\))\?\%(\.and_return\\|\s=>\s\?\)\?(\?\s\?\(@\?\"\?\w\+\"\?\)\?)\?!allow(\1).to receive(\2) { \3 }!<CR>

"
" Plugins
"
" Toggle NERDTree
map <Leader>nt :NERDTreeToggle<CR>
" Gundo toggle
map <Leader>gd :GundoToggle<CR>
" Turbux
let g:turbux_command_prefix = 'zsbx'
" Auto-Clean Fugitive Buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


" neet a way to disable GitGutter since it slow...
" GitGutterDisable

" CheatSheets
" - Tidy xml
"
"     :%!tidy -i -q -w 0 -xml
"
" - Tidy xhtml
"
"     :%!tidy -i -q -w 0 -asxhtml
"
" - Markdown to html
"
"     :%!Markdown.pl --html4tags
"
" - Convert New Hash Syntax to the old one...
"
"     %s/\(\w\+\):\(\s\+\(['":({\[\w]\)\?\)/:\1 =>\2/g

" Use system clipboard
" set clipboard=unnamed

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
