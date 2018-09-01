#!/bin/bash

# dotfiles installation dir 
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install packages
pacman -S --needed < "$DOTFILES_DIR/pkglist"

# install python packages
pip3 install -r "$DOTFILES_DIR/requirements.txt"

# install pureline
git clone https://github.com/chris-marsh/pureline.git ~/pureline/

# install vscode extensions
code --install-extension Equinusocio.vsc-material-theme
code --install-extension julialang.language-julia
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.Go
code --install-extension naumovs.color-highlight
code --install-extension PeterJausovec.vscode-docker
code --install-extension ritwickdey.LiveServer
code --install-extension robertohuertasm.vscode-icons
code --install-extension tomoki1207.pdf

# create symbolic links
ln -sf "$DOTFILES_DIR/bash/.bashrc" ~
ln -sf "$DOTFILES_DIR/bash/.bash_aliases" ~
ln -sf "$DOTFILES_DIR/bash/.bash_functions" ~
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/pureline/.pureline.conf" ~
ln -sf "$DOTFILES_DIR/i3/config" ~/.i3/
ln -sf "$DOTFILES_DIR/code/settings.json" ~/.config/Code/User/
ln -sf "$DOTFILES_DIR/code/keybindings.json" ~/.config/Code/User/
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~

# set wallpaper
feh --bg-scale "$DOTFILES_DIR/wallpaper/E2EBF0.jpg"
