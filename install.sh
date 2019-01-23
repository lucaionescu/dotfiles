#!/bin/bash

# dotfiles installation dir
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install packages
pacman -S --needed < "$DOTFILES_DIR/pkglist"

# install python packages
pip3 install -r "$DOTFILES_DIR/requirements.txt"

# install vscode extensions
code --install-extension ms-python.python
code --install-extension naumovs.color-highlight
code --install-extension ritwickdey.LiveServer
code --install-extension james-yu.latex-workshop

# create symbolic links
ln -sf "$DOTFILES_DIR/bash/.bashrc" ~
ln -sf "$DOTFILES_DIR/bash/.aliases" ~
ln -sf "$DOTFILES_DIR/bash/.functions" ~
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/code/settings.json" ~/.config/Code/User/
ln -sf "$DOTFILES_DIR/code/keybindings.json" ~/.config/Code/User/

ln -sf "$DOTFILES_DIR/i3/config" ~/.i3/
ln -sf "$DOTFILES_DIR/x/.Xresources" ~/.Xresources

# set terminal emacs as default editor
VISUAL="emacs -nw"; export VISUAL EDITOR="emacs -nw"; export EDITOR

