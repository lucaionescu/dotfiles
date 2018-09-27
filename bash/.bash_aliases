alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias emacs="emacs -nw"
alias free='free -h'                      # show sizes in MB
alias g="git"
alias hn="hostname"
alias julia="~/julia-1.0.0/bin/julia"
alias l="ls -lahFG"
alias more=less
alias np='nano -w PKGBUILD'
alias open="xdg-open"
alias rg="ranger"
alias wifilist="nmcli device wifi list"
alias zat="zathura"

alias _="sudo"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"

alias bashrc="emacs $HOME/Documents/dotfiles/bash/.bashrc"
alias i3conf="emacs $HOME/Documents/dotfiles/i3/config"
alias myupdate="sudo $HOME/Documents/dotfiles/scripts/myupdate.sh"
alias reload="source $HOME/.bashrc && i3-msg reload"
alias xresources="emacs $HOME/Documents/dotfiles/x/.Xresources"

