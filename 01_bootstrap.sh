#!/bin/sh

mkdir -p ~/.config 2>/dev/null

set -xe

ln -s `pwd`/config/awesome $HOME/.config/

ln -s `pwd`/vim $HOME/.vim
ln `pwd`/vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# installing vim plugins may take long time
vim +PluginInstall +qall >/dev/null 2>/dev/null

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

ln `pwd`/zshrc $HOME/.zshrc

# install hyperzsh theme (https://github.com/tylerreckart/hyperzsh)
wget https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme -O ~/.oh-my-zsh/themes/hyperzsh.zsh-theme
