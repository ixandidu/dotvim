" Pathogen initialize
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" based on http://github.com/jferris/config_files/blob/master/vimrc
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
" keep 50 lines of command line history
set history=50
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
" do incremental searching
set incsearch

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

" \ is the leader character
" let mapleader = ","

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Toggle NERDTree 
map <Leader>nt :NERDTreeToggle<CR>

" Gundo toggle
map <Leader>gd :GundoToggle<CR>

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

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%:t")<CR>

" Maps autocomplete to tab
"imap <Tab> <C-N>

imap <C-L> <Space>=><Space>

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

colorscheme default 

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

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

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;

let g:fuf_splitPathMatching=1

" Open URL
" function! OpenURL()
"   let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
"   echo s:uri
"   if s:uri != ""
"     exec "!open \"" . s:uri . "\""
"   else
"     echo "No URI found in line."
"   endif
" endfunction
" map <Leader>w :call OpenURL()<CR>
" command -bar -nargs=1 OpenURL :!open <args>

set hidden " avoid vim to prompt when changing buffer
set textwidth=80

hi NonText    ctermbg=None ctermfg=0 guifg=#646464 " guibg=None
hi SpecialKey ctermbg=None ctermfg=0 guifg=#646464 " guibg=None
hi LineNr     ctermbg=0    ctermfg=7 guifg=#999999 guibg=#323232

" highlight trailing whitespace, tab characters, and text at column > 80
hi XnddUtils ctermbg=0 ctermfg=7 guibg=#323232 "guifg=#000000
match XnddUtils /\s\+$\|\t\+\|\%>80v/
" 	example of tab and trailing whitespaces     
" example of line that exceed more that 80 column 1 2 3 4 5 6 7 8 9 0 11 12 13 14 15

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
autocmd VimEnter * NERDTree
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
