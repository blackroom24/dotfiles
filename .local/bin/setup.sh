#!/bin/bash
DOTFILES="$HOME/.config/dotfiles"
git clone --bare https://github.com/blackroom24/Dotfiles.git $DOTFILES
config() {
   /usr/bin/git --git-dir=$DOTFILES --work-tree=$HOME $@
}
echo "Existing files will be overwritten"
config checkout -f
config config status.showUntrackedFiles no
echo "Setting up pure Prompt"
git clone https://github.com/sindresorhus/pure.git "$HOME/.config/zsh/pure"
echo "My Dmenu Build"
git clone https://github.com/blackroom24/dmenu.git "$HOME/.local/opt"
echo "My Dwm build"
git clone https://github.com/blackroom24/dwm.git "$HOME/.local/opt"
echo "Statubar for dwm"
git clone https://github.com/blackroom24/dwmblocks.git "$HOME/.local/opt"
echo "Finished Installed the Required apps"
