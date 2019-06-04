. $HOME/z.sh

# aliases
alias cp="cp -i"
alias df="df -h"
alias emacs="emacs -nw"
alias g="git"
alias h="history"
alias lab="jupyter-lab"
alias l="ls -lahFG"
alias p="python3"
alias reload="source ~/.zshrc"
alias _="sudo"
alias t="tree -aC"
alias top="htop"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

# functions
function cipssh() {
  if [ "$*" == "" ]; then
    ssh ionescu@remote.cip.ifi.lmu.de
  else
    ssh -X -o 'ProxyCommand ssh -W %h:%p ionescu@remote.cip.ifi.lmu.de' ionescu@"$1"
  fi
}

# change to directory and list content
function cdl() {
  cd "$1" && l
}

# create directory and cd to it
function mcd() {
  mkdir -p "$1"
  cd "$1"
}

PROMPT='%~/ '
