#!/bin/zsh

ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/git/.gitignore_global ~/.gitignore_global
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/zsh/.zshrc ~/.zshrc

bash macos/defaults.sh

