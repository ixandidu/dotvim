if empty(glob('~/.vim/autoload/plug.vim'))
  echon '> Downloading the latest vim-plug and installing plugs'
  silent !curl
       \ -sfLo
       \ ~/.vim/autoload/plug.vim
       \ --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugs')
" Utilities
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' } " On-demand loading
Plug 'chrisbra/Recover.vim'
Plug 'DataWraith/auto_mkdir'
"Plug 'mkitt/tabline.vim'

" General Programming Support
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
"Plug 'xolox/vim-session'

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" Git Support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Syntax (Language/Framework support)
Plug 'ixandidu/vim-markdown'
"Plug 'kchmck/vim-coffee-script'

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
"Plug 'ecomba/vim-ruby-refactoring'
"Plug 'tpope/vim-bundler'

"Plug 'thoughtbot/vim-rspec'
"Plug 'jpalardy/vim-slime'
Plug 'jgdavey/vim-turbux'
Plug 'jgdavey/tslime.vim'
call plug#end()
