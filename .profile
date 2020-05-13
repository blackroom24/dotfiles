# Adding local bin to path
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# Defaults
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="chromium"
export TERMINAL="kitty"
# export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
export PAGER="less"
export QT_QPA_PLATFORMTHEME="gtk3"
# Cleanup
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export LESSHISFILE="-"
eval "$(dircolors "${XDG_CONFIG_HOME:-$HOME/.config}"/dircolors)"
# App settings
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonstartup.py"
export LESS=-R
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export _JAVA_AWT_WM_NONREPARENTING=1 # for dwm & xmonad
