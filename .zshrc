eval "$(/opt/homebrew/bin/brew shellenv)"

fpath+=/opt/homebrew/share/zsh/site-functions

if [ -e $HOMEBREW_PREFIX/etc/profile.d/z.sh ]; then
  source $HOMEBREW_PREFIX/etc/profile.d/z.sh
fi

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

HISTORY_IGNORE="(ls|cd|pwd|exit)"
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_NO_STORE         # Don't store history commands

# aliases
alias _="sudo"
alias b="bat --theme=Nord"
alias chat="cheat"
alias cl="clear"
alias cp="cp -irv"
alias df="df -h"
alias dud="du -d 1 -h"
alias g="git"
alias grep="grep --color"
alias h="history"
alias l="ls -lahFG"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias o="open"
alias oo="open ."
alias p="python3"
alias reload="source ~/.zshrc"
alias rm="rm -v"
alias v="nvim"

alias chrome="/Applications/Google\ Chrome\ Dev.app/Contents/MacOS/Google\ Chrome\ Dev --headless"

# tmux
alias tm="tmux"
alias tmn="tmux new-session -t"

# docker
alias dc="docker container"
alias di="docker image"

# jumping around
alias ..="cd .."
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../..'
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

. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"

source <(fzf --zsh)

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ioan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"

eval "$(direnv hook zsh)"
