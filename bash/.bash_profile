# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

# external alias file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
  fi

# external functions file
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
  fi

. $HOME/z.sh

export EDITOR="emacs -nw"
export PATH="/home/ionescu/miniconda3/bin:$PATH"
export PS1="\[\e[36m\]\`parse_conda_environment\`\[\e[m\]\\w \[\e[34m\]\`parse_git_branch\`\[\e[m\]\[\e[33m\]➜\[\e[m\] "

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
