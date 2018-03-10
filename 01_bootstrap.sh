#!/usr/bin/env ruby

DOTFILES = %w[vimrc zshrc screenrc]

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

rm "$HOME/.zshrc"
ln "$CWD/zshrc" "$HOME/.zshrc"

### root ###
mkdir -p "$HOME/root/{bin,usr/local/apps}"

usrlocal="$HOME/root/usr/local"
apps="$usrlocal/apps"

### golang ###
mkdir "$usrlocal/go"

