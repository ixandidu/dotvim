"""" General Behavior """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                  " Use Vim settings, rather then Vi settings
set hidden                        " Hide warning for unsaved changes when changing buffer
set nojoinspaces                  " Use only one space when joining lines
set visualbell                    " Use a visual bell instead of beeping
set nopaste
set splitright                    " Split window to the right of the curent one
"set splitbelow                    " Split window below the curent one
"set autoread                      " Auto reload buffers on unmodified file
"set autowrite                     " Auto save changes before switching buffers
"set  clipboard=unnamed            " Use system clipboard
set   backspace=indent,eol,start  " allow backspacing over everything
set cryptmethod=blowfish2         " Use blowfish2 when saving encrypted file
set    encoding=utf-8             " Sets the character encoding used inside Vim
set     history=100               " Command line and search history to keep

" Use The Silver Searcher instead of grep when available
if executable("ag")
  set     grepprg=ag\ -S\ --vimgrep\ $*
  set grepformat^=%f:%l:%c:%m   " file:line:column:message
endif

if has("autocmd")
  augroup FocusPrevTabOnClosed
    autocmd!
    au TabLeave * let g:closedTabPageNr = tabpagenr()
    au TabClosed *
          \ if tabpagenr() > 1 && g:closedTabPageNr == tabpagenr() |
          \   tabprev |
          \ endif
  augroup END

  augroup ActivateCursorOnActiveWindow
    autocmd!
    autocmd WinEnter * set cursorline cursorcolumn
    autocmd WinLeave * set nocursorline nocursorcolumn
  augroup END

  augroup JumpToLastCursorPosition
    autocmd!
    " Don't do it when the position is invalid or when inside an event handler
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
  augroup END

  augroup AutoloadVimrcOnSave
    autocmd!
    autocmd BufWritePost *.vim,.vimrc,.gvimrc source $MYVIMRC
  augroup END

endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Autocomplete """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" only complete to the longest unambiguous match, show a menu and location
" where we can found the displayed string)
set completeopt=longest,menu,preview
set    wildmode=list:longest,list:full

" set completion to (in prioritical order)
" * current buffer
" * loaded buffer that exists in the list (opened one)
" * unloaded buffer that exists in the list (hidden one)
" * tag completion (current tags file)
set complete=.,b,u,t

" Ignore these when completing names by pressing tab
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.o,*.obj,*~
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Scrolling """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set     scrolloff=3  " Show 3 lines of content arround the cursor
set sidescrolloff=5  " Show 5 chars of content arround the cursor
set    sidescroll=1  " ...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Search """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch             " Find matches while typing in search command
set hlsearch              " Highlight all matches
set ignorecase smartcase  " case only matters with mixed case expressions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Visual """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme xndd
set number           " Show line number
set showcmd          " Show incomplete commands
set showmode         " Show current mode on the left bottom
set ruler            " Show the line and column number of the cursor position
set nowrap           " Switch wrap off for everything
syntax enable        " Enable syntax highlighting while keeping current color setting
syntax on            " Enable Syntax highlighting and let vim to overrule settings with the defaults
set numberwidth=5    " Set line number width
set   textwidth=80   " Turn white space to line break when n column reached
set showtabline=2    " Always show tab line
set  laststatus=2    " Always show status line
set   synmaxcol=80   " Apply syntax coloring until n  column

set list             " Show tabs, trailing whitespace, and eol
set listchars=tab:»\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

if exists('+colorcolumn')
  "let &colorcolumn="80," . join(range(120, 999), ",")
  let &colorcolumn=join(range(81, 120), ",")
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" File type detection """""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on          " Enable file type (`filetype`) detection
filetype plugin on   " Enable loading the plugin for specific file types
filetype indent on   " Enable loading the indent file for specific file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Turn off swap backup file """""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile       " Turn off swap files (.swp)
set nobackup         " Don't make a backup before overwriting a file
set nowritebackup    " Write file in place
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Undo Persistent """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('persistent_undo')
  if !isdirectory(expand('~') . '/.vim/undodir')
    silent !mkdir ~/.vim/undodir > /dev/null 2>&1
  endif

  set undodir=~/.vim/undodir
  set undofile
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" Indentation """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent smartindent smarttab expandtab
set  shiftwidth=2
set softtabstop=2
set     tabstop=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" view man pages without shelling out.
"runtime! ftplugin/man.vim

" load all defined plugins
source ~/.vim/plugs.vim

" load configuration for plugin and keymap
source ~/.vim/config.vim

if filereadable(".vimrc.local")
  source .vimrc.local
endif

" CheatSheets
" - Tidy xml           :%!tidy -i -q -w 0 -xml
" - Tidy xhtml         :%!tidy -i -q -w 0 -asxhtml
" - Markdown to html   :%!Markdown.pl --html4tags
"
" - Convert New Hash Syntax to the old one...
"
"     %s/\(\w\+\):\(\s\+\(['":({\[\w]\)\?\)/:\1 =>\2/g
"
" - Convert Old Hash Syntax to the new one...
"
"     %s/:\([^ ]*\)\(\s*\)=>/\1:/g
