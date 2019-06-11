. $HOME/z.sh

PROMPT='%~/ '

# aliases
alias bubc="brew upgrade && brew cleanup"
alias bubo="brew update && brew outdated"
alias bubu="bubo && bubc"
alias cp="cp -iv"
alias df="df -h"
alias emacs="emacs -nw"
alias fd="find . -type d -name"
alias ff="find . -type f -name"
alias g="git"
alias h="history"
alias lab="jupyter-lab"
alias l="ls -lahFG"
alias mkdir="mkdir -pv"
alias mv="mv -v"
alias p="python3"
alias reload="source ~/.zshrc"
alias _="sudo"
alias t="tree -aC"
alias top="htop"

alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias -- -="cd -"

# change to directory and list content
function cdl() {
  cd "$1" && l
}

# create directory and cd to it
function mcd() {
  mkdir -p "$1"
  cd "$1"
}

# functions
function cipssh() {
  if [ "$*" == "" ]; then
    ssh ionescu@remote.cip.ifi.lmu.de
  else
    ssh -X -o 'ProxyCommand ssh -W %h:%p ionescu@remote.cip.ifi.lmu.de' ionescu@"$1"
  fi
}
