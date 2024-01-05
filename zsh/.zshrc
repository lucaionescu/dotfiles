eval "$(/opt/homebrew/bin/brew shellenv)"

fpath+=/opt/homebrew/share/zsh/site-functions

autoload -Uz compinit && compinit
autoload -U colors && colors

# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL="->"
prompt pure

bindkey -v
bindkey '^R' history-incremental-search-backward

export KEYTIMEOUT=1
export FFMPEG_PATH=$(which ffmpeg)

# aliases
alias _="sudo"
alias b="bat --theme=Nord"
alias chat="cheat"
alias c="code ."
alias cl="clear"
alias cp="cp -irv"
alias df="df -h"
alias dud="du -d 1 -h"
alias g="git"
alias grep="grep --color"
alias h="history -500"
alias l="ls -lahFG"
alias lsd='ls -dlahG */' # list only directorries
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias o="open"
alias oo="open ."
alias p="python3"
alias reload="source ~/.zshrc"
alias rm="rm -v"
alias v="nvim"

alias ..l="cd .. && l"

# processing-py
alias ppy="java -jar ~/generative/processing-py/processing.py-3017-macosx/processing-py.jar"

# jumping around
alias ..="cd .."
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias -- -="cd -"

# colorize man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme=Nord'"

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
__conda_setup="$('/Users/ioan/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ioan/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ioan/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ioan/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

