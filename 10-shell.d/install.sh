#!/bin/zsh

if [[ ! -d $DCACHE ]]; then
	mkdir $DCACHE
fi

if [[ -z $(which antibody 2>/dev/null) ]]; then
	curl -sL https://git.io/antibody | sh -s
fi

antibody bundle <"$ZCONF/bundle.txt" >$DCACHE/zsh_plugins_static.zsh
antibody update

ln -sf $ZHOME/zshrc $HOME/.zshrc
