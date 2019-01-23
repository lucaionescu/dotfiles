DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
UNAME		 := $(shell uname -s)

ifeq ($(UNAME), Darwin)
	OS := macos
else ifeq ($(UNAME), Linux)
	OS := linux
endif

all: install

install: $(OS)

.PHONY: help usage
.SILENT: help usage

help: usage

usage:
	printf "\\n\
	\\033[1mDOTFILES\\033[0m\\n\
	\\n\
	Custom macOS settings and terminal configurations.\\n\
	See README.md for detailed usage information.\\n\
	\\n\
	\\033[1mUSAGE:\\033[0m make [target]\\n\
	\\n\
	  make         Install all configurations and applications.\\n\
	\\n\
	  make link    Symlink only Bash configurations to the home directory.\\n\
	\\n\
	  make unlink  Remove symlinks created by \`make link\`.\\n\
	\\n\
	"

.PHONY: linux macos link unlink

linux:
	pacman -S --needed < "${DOTFILES_DIR}/pkglist"
	ln -sf "${DOTFILES_DIR}/redshift.conf" ~/.config/redshift.conf
	ln -sf "${DOTFILES_DIR}/x/.Xresources" ~/.Xresources
	ln -sf "${DOTFILES_DIR}/i3/config" ~/.i3/

macos:
	brew
	git-init
	bash $(DOTFILES_DIR)/macos/defaults.sh

link:
	ln -sf "${DOTFILES_DIR}/bash/.bashrc" $(HOME)/.bashrc
	ln -sf "${DOTFILES_DIR}/bash/.aliases" $(HOME)/.aliases
	ln -sf "${DOTFILES_DIR}/bash/.functions" $(HOME)/.functions
	ln -sf "${DOTFILES_DIR}/bash/.bash_profile" $(HOME)/.bash_profile

unlink:
	unlink "${HOME}/bash/.bashrc" $(HOME)/.bashrc
	unlink "${HOME}/bash/.aliases" $(HOME)/.aliases
	unlink "${HOME}/bash/.functions" $(HOME)/.functions
	unlink "${HOME}/bash/.bash_profile" $(HOME)/.bash_profile

.PHONY: brew git-init emacs pip vscode

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle --file=$(DOTFILES_DIR)/macos/.Brewfile

git-init:
	ln -sf "${DOTFILES_DIR}/git/.gitconfig" $(HOME)/.gitconfig
	ln -sf "${DOTFILES_DIR}/git/.gitignore_global" $(HOME)/.gitignore_global

emacs:
	VISUAL="emacs -nw"; export VISUAL EDITOR="emacs -nw"; export EDITOR

pip:
	pip install --upgrade pip
	pip3 install -r "${DOTFILES_DIR}/requirements.txt"

vscode:
	code --install-extension ms-python.python
	code --install-extension naumovs.color-highlight
	code --install-extension ritwickdey.LiveServer
	code --install-extension james-yu.latex-workshop
