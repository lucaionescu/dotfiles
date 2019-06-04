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
	install_oh_my_zsh
	git-init
	pacman -S --needed < "${DOTFILES_DIR}/manjaro/pkglist"
	ln -sf ${DOTFILES_DIR}/manjaro/x/.Xresources $(HOME)/.Xresources
	ln -sf ${DOTFILES_DIR}/manjaro/i3/config $(HOME)/.i3/
	ln -sf ${DOTFILES_DIR}/manjaro/bash/.bashrc $(HOME)/.bashrc

macos:
	bash $(DOTFILES_DIR)/macos/defaults.sh
	brew
	install_z
	install_oh_my_zsh
	softwareupdate -ai

link:
	ln -sf ${DOTFILES_DIR}/bash/.bash_profile $(HOME)/.bash_profile
	ln -sf ${DOTFILES_DIR}/zsh/.zshrc $(HOME)/.zshrc
	ln -sf ${DOTFILES_DIR}/zsh/.zprofile $(HOME)/.zprofile
	ln -sf ${DOTFILES_DIR}/git/.gitconfig $(HOME)/.gitconfig
	ln -sf ${DOTFILES_DIR}/git/.gitignore_global $(HOME)/.gitignore_global

unlink:
	unlink $(HOME)/.bash_profile
	unlink $(HOME)/.zshrc
	unlink $(HOME)/.zprofile
	unlink $(HOME)/.gitconfig
	unlink $(HOME)/.gitignore_global

.PHONY: brew git-init install_z install_oh_my_zsh

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle --file=$(DOTFILES_DIR)/macos/.Brewfile

install_z:
	curl https://raw.githubusercontent.com/rupa/z/master/z.sh > $(HOME)/z.sh
	chmod +x $(HOME)/z.sh

install_oh_my_zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
