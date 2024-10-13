#!/bin/zsh

ln -sf $(pwd)/nvim ~/.config/nvim
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.gitignore_global ~/.gitignore_global
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.zshrc ~/.zshrc

bash macos/defaults.sh

