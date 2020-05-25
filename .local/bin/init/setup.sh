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
echo "Done"
