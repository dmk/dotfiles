#!/bin/sh

set -xe

CWD=$(pwd)

rm -rf "$HOME/.config/awesome" "$HOME/.vimrc" "$HOME/.vim"
if ! test -d "$HOME/.config"; then
  mkdir "$HOME/.config" 2>/dev/null
fi

mkdir -p "$HOME/.vim/colors"

ln -s "$CWD/config/awesome" "$HOME/.config/"

### vim ###
ln "$CWD/vimrc" "$HOME/.vimrc"

wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P "$HOME/.vim/colors"

git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"

# installing vim plugins may take long time
vim +PluginInstall +qall

### zsh ###
rm -rf "$HOME/.*zsh*"

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

rm "$HOME/.zshrc"
ln "$CWD/zshrc" "$HOME/.zshrc"

### root ###
mkdir -p "$HOME/root/{bin,usr/local/apps}"

usrlocal="$HOME/root/usr/local"
apps="$usrlocal/apps"

### golang ###
mkdir "$usrlocal/go"

### st ###
git clone https://git.suckless.org/st "$apps/st"
