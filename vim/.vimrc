syntax on

set autoindent
set expandtab
set hlsearch
set noerrorbells
set number
set shiftwidth=4
set showcmd
set showmatch
set softtabstop=4
set tabstop=4

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'fatih/vim-go'

call plug#end()

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set updatetime=500

