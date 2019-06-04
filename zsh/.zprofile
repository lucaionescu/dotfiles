# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

# aliases
alias cp="cp -i"
alias df="df -h"
alias emacs="emacs -nw"
alias g="git"
alias h="history"
alias lab="jupyter-lab"
alias l="ls -lahFG"
alias p="python3"
alias reload="source ~/.zprofile"
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

. $HOME/z.sh

export EDITOR="emacs -nw"
export PATH="/home/ionescu/miniconda3/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ioan/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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
