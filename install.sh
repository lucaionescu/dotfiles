#!/bin/bash

# dotfiles installation dir 
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DOTFILES_DIR/bash/.bashrc" ~
ln -sf "$DOTFILES_DIR/bash/.bash_aliases" ~
ln -sf "$DOTFILES_DIR/bash/.bash_functions" ~
ln -sf "$DOTFILES_DIR/bash/.bash_profile" ~
