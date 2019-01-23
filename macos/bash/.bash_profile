# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

export PS1="\w \[\e[33m\[➜\[\e[m\] \[$(tput sgr0)\]"
export EDITOR="emacs -nw"

# external alias file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
  fi

# external functions file
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
  fi

eval "$(pipenv --completion)"

. $HOME/z.sh