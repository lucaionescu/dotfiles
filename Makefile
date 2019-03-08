DOTFILES_DIR := $(shell echo $(HOME)/dotfiles)
UNAME := $(shell uname -s)

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
	$(OS) settings installation script.\\n\
	\\n\
	  make         install all configurations and applications.\\n\
	\\n\
	  make link    create symbolic links to the bash configuration files.\\n\
	\\n\
	  make unlink  remove symbolic links created by \`make link\`.\\n\
	\\n\
	"

.PHONY: linux macos link unlink

linux:
	install_z
	git-init
	pacman -S --needed < "${DOTFILES_DIR}/manjaro/pkglist"
	ln -sf ${DOTFILES_DIR}/manjaro/x/.Xresources $(HOME)/.Xresources
	ln -sf ${DOTFILES_DIR}/manjaro/i3/config $(HOME)/.i3/
	ln -sf ${DOTFILES_DIR}/manjaro/bash/.bashrc $(HOME)/.bashrc

macos:
	install_z
	brew
	git-init
	bash $(DOTFILES_DIR)/macos/defaults.sh
	softwareupdate -ai

link:
	git-init
	ln -sf ${DOTFILES_DIR}/bash/.bash_aliases $(HOME)/.bash_aliases
	ln -sf ${DOTFILES_DIR}/bash/.bash_functions $(HOME)/.bash_functions
	ln -sf ${DOTFILES_DIR}/bash/.bash_profile $(HOME)/.bash_profile

unlink:
	unlink ${HOME}/.bash_aliases
	unlink ${HOME}/.bash_functions
	unlink ${HOME}/.bash_profile

.PHONY: brew git-init

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle --file=$(DOTFILES_DIR)/macos/.Brewfile

git-init:
	ln -sf ${DOTFILES_DIR}/git/.gitconfig $(HOME)/.gitconfig
	ln -sf ${DOTFILES_DIR}/git/.gitignore_global $(HOME)/.gitignore_global

z:
	curl https://raw.githubusercontent.com/rupa/z/master/z.sh > $(HOME)/z.sh
	chmod +x $(HOME)/z.sh
