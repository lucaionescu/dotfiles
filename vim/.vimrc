syntax on

set autoindent
set autowrite
set cursorline
set expandtab
set hlsearch
set list
set noerrorbells
set nocompatible
set relativenumber
set showcmd
set showmatch
set softtabstop=4
set shiftwidth=4
set tabstop=4
set updatetime=500

filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'sheerun/vimrc'
call plug#end()

let g:python_highlight_all = 1

let g:rainbow_active = 1
