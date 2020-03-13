syntax on

set autoindent
set expandtab
set ruler
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

call plug#end()
