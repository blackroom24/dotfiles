[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
HISTFILE=$HOME/.cache/bash_history
shopt -s histappend

if [ -n "$PS1" ]; then
    for file in ~/.config/{bash_prompt,aliasrc}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done
    unset file;
fi

# Bash with attitude
[ -f /etc/bash.command-not-found ] && source /etc/bash.command-not-found
# Auto Jump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
