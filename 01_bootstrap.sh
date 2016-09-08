#!/bin/sh

mkdir ~/.config 2>/dev/null
mkdir -p ~/.vim/colors

set -xe

ln -s `pwd`/config/awesome $HOME/.config/

######## vim ########
ln `pwd`/vimrc $HOME/.vimrc

wget https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim -P ~/.vim/colors

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# installing vim plugins may take long time
vim +PluginInstall +qall >/dev/null 2>/dev/null

######## zsh ########
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

ln `pwd`/zshrc $HOME/.zshrc

# install hyperzsh theme (https://github.com/tylerreckart/hyperzsh)
wget https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme -O ~/.oh-my-zsh/themes/hyperzsh.zsh-theme
