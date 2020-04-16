#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# Sanitization

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd

# Aliasrc
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
# Secrets
[ -f "$HOME/.local/private" ] && source "$HOME/.local/private"
#  Prompt
fpath+=$ZDOTDIR/pure
autoload -U promptinit; promptinit
prompt pure

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION

# Include Hidden files
_comp_options+=(globdots)

# ZSH keybinds
bindkey -e

# Plugins and settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
# Install manualy or AUR
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] \
    && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] \
    && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
