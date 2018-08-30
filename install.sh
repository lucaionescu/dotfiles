#!/bin/bash

# dotfiles installation dir 
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DOTFILES_DIR/bash/.bashrc" ~
ln -sf "$DOTFILES_DIR/bash/.bash_aliases" ~
ln -sf "$DOTFILES_DIR/bash/.bash_functions" ~
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~
ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/pureline/.pureline.conf" ~
ln -sf "$DOTFILES_DIR/i3/config" ~/.i3/

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
