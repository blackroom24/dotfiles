# Defaults
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="chromium"
export TERMINAL="st"
export QT_QPA_PLATFORMTHEME="qt5ct"
# Cleanup
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export DOTFILES="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export LESSHISFILE=-
eval "$(dircolors "${XDG_CONFIG_HOME:-$HOME/.config}"/dircolors)"
# App settings
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/pythonstartup.py"
export LESS=-R
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_so=$(printf '\e[01;33m')
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_mb=$(printf '\e[01;31m')
# Android Specific
export _JAVA_AWT_WM_NONREPARENTING=1
export ANDROID_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
