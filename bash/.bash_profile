# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
# export PATH

# aliases
alias cp="cp -i"
alias df="df -h"
alias emacs="emacs -nw"
alias g="git"
alias lab="jupyter-lab"
alias l="ls -lahFG"
alias p="python3"
alias reload="source ~/.bash_profile"
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

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# parse conda environment
function parse_conda_environment {
	ENV_NAME="$CONDA_DEFAULT_ENV"
	if [ ! "${ENV_NAME}" == "base" ]
	then
		echo "(${ENV_NAME}) "
	else
		echo ""
	fi
}

. $HOME/z.sh

export EDITOR="emacs -nw"
export PATH="/home/ionescu/miniconda3/bin:$PATH"
export PS1="\[\e[36m\]\`parse_conda_environment\`\[\e[m\]\\w \[\e[34m\]\`parse_git_branch\`\[\e[m\]\[\e[33m\]->\[\e[m\] "

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
