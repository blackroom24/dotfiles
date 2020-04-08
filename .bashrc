[[ $- != *i* ]] && return

HISTFILE=$HOME/.cache/bash_history
[ -n "$PS1" ] && source $HOME/.config/.bash_profile

[ -f /etc/bash.command-not-found ] && source /etc/bash.command-not-found

