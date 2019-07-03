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
	ln -sf ${DOTFILES_DIR}/manjaro/.Xresources $(HOME)/.Xresources
	ln -sf ${DOTFILES_DIR}/manjaro/i3_config $(HOME)/.i3/config
	ln -sf ${DOTFILES_DIR}/manjaro/.bashrc $(HOME)/.bashrc

macos:
	bash $(DOTFILES_DIR)/macos/defaults.sh
	brew
	install_z
	softwareupdate -ai

link:
	ln -sf ${DOTFILES_DIR}/zsh/.zshrc $(HOME)/.zshrc
	ln -sf ${DOTFILES_DIR}/zsh/.zprofile $(HOME)/.zprofile
	ln -sf ${DOTFILES_DIR}/git/.gitconfig $(HOME)/.gitconfig
	ln -sf ${DOTFILES_DIR}/git/.gitignore_global $(HOME)/.gitignore_global

unlink:
	unlink $(HOME)/.zshrc
	unlink $(HOME)/.zprofile
	unlink $(HOME)/.gitconfig
	unlink $(HOME)/.gitignore_global

.PHONY: brew git-init install_z install_oh_my_zsh

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew analytics off
	brew bundle --file=$(DOTFILES_DIR)/macos/.Brewfile

install_z:
	curl https://raw.githubusercontent.com/rupa/z/master/z.sh > $(HOME)/z.sh
	chmod +x $(HOME)/z.sh

