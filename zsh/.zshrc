. $HOME/z.sh

setopt GLOB_DOTS

export LC_ALL=en_US.UTF-8

autoload -Uz compinit && compinit

# pure prompt
autoload -U promptinit; promptinit
prompt pure

autoload -U colors && colors
# PS1="%{$fg[yellow]%}%~/ %{$reset_color%}%"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.histfile

# aliases
alias b="bat"
alias bubc="brew upgrade && brew cleanup"
alias bubo="brew update && brew outdated"
alias bubu="bubo && bubc"
alias c="code"
alias cl="clear"
alias cp="cp -irv"
alias df="df -h"
alias dud="du -d 1 -h"
alias dv="deactivate"
alias emacs="emacs -nw"
alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias g="git"
alias grep="grep --color"
alias h="history -500"
alias lab="jupyter-lab"
alias l="ls -lahFG"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias nb="jupyter-notebook"
alias o="open"
alias p="python3"
alias reload="source ~/.zshrc"
alias rm="rm -v"
alias _="sudo"
alias t="tree -aC"
alias top="htop"
alias v="vim"

alias av="conda activate"
alias dv="conda deactivate"

alias ..="cd .."
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias -- -="cd -"

# change to directory and list content
function cl() {
	cd "$1" && l
}

# create directory and cd to it
function mcd() {
	mkdir -p "$1"
	cd "$1"
}

# cheat.sh
function cheat() {
	curl "cheat.sh/""$1"
}

function cipssh() {
	if [ "$1" = "" ]; then
		ssh ionescu@remote.cip.ifi.lmu.de
	else
		ssh -X -o 'ProxyCommand ssh -W %h:%p ionescu@remote.cip.ifi.lmu.de' ionescu@"$1"
	fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ioan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/Users/ioan/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/Users/ioan/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/Users/ioan/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

# added by travis gem
[ -f /Users/ioan/.travis/travis.sh ] && source /Users/ioan/.travis/travis.sh
