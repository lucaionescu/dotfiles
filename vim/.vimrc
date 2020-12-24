syntax on

set autoindent
set autowrite
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
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'xolox/vim-misc'
call plug#end()

let g:python_highlight_all = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set updatetime=500

filetype plugin on

