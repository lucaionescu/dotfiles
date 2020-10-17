syntax on

set autoindent
set cursorline
set expandtab
set hlsearch
set noerrorbells
set number
set shiftwidth=4
set showcmd
set showmatch
set softtabstop=4
set tabstop=4

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kien/rainbow_parentheses.vim'
Plug 'fatih/vim-go'
Plug 'xolox/vim-misc'

call plug#end()

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set updatetime=500

filetype plugin on

