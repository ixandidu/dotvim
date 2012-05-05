" Pathogen initialize
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" based on http://github.com/jferris/config_files/blob/master/vimrc
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set noswapfile
set nobackup         " Don't make a backup before overwriting a file
set nowritebackup    " And again

" keep 50 lines of command line history
set history=50
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
" do incremental searching
set incsearch
" Show 3 lines of content arround the cursor
set scrolloff=3
" Set the Terminal's title
set title
" No Beeping
set visualbell

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap off for everything
set nowrap

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
  au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

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

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Toggle NERDTree
map <Leader>nt :NERDTreeToggle<CR>

" Gundo toggle
map <Leader>gd :GundoToggle<CR>

" disabble autoindenting when pasting text from clipboard
set pastetoggle=<F2>

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
set mouse=a

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

colorscheme xndd

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" ignore some file extentions when completing names by pressing tab
set wildignore=*.swp,*.bak,*.pyc,*.class

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;

let g:fuf_splitPathMatching=1

" Open URL
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>
"command -bar -nargs=1 OpenURL :!open <args>

set hidden " avoid vim to prompt when changing buffer
set textwidth=80

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

" Show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif

  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" I always forget using sudo
cmap w!! w !sudo tee % >/dev/null
"cmap w!! %!sudo tee > /dev/null %

" Auto-Clean Fugitive Buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" Add git branch to status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nnoremap <Leader>cl :set cursorline!<CR>
nnoremap <Leader>cc :set cursorcolumn!<CR>

set cursorline

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


" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
