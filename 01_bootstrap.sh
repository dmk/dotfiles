#!/bin/sh

rm -rf ~/.config/awesome ~/.vimrc ~/.vim

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

####### zsh ########
rm -rf ~/.*zsh*

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

rm ~/.zshrc
ln `pwd`/zshrc $HOME/.zshrc
