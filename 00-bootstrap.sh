#!/bin/zsh

export DOTFILES="$HOME/.files"
export ZHOME="$DOTFILES/10-shell.d"
export ZCONF="$ZHOME/config"

source "$ZHOME/env.zsh"

#
# Helpers
#

info() {
	printf "\r  [\033[00;34m..\033[0m] $1\n"
}

user() {
	printf "\r  [\033[0;33m??\033[0m] $1\n"
}

success() {
	printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
	printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n\n"
	exit
}

dotlink() {
	src="$1"
	dest="$2"

	if [ -z "$dest" ]; then
		dest="$HOME/.$1"
	fi

	if [ -e "$2" ]; then
		if [ "$(readlink "$2")" = "$1" ]; then
			success "Skip $1"
			return 0
		else
			mv "$2" "$2.backup"
			success "Move $2 to $2.backup"
		fi
	fi

	ln -sf "$1" "$2" && success "Link $1 to $2"
}

# Install a pacman package
pacadd() {
	sudo pacman --noconfirm -S $@
}

#
# Install
#

info "Updating pacman db"
sudo pacman -Sy

info 'Installing dotfiles'
for installer in $(find -H "$DOTFILES" -name 'install.sh'); do
	info "Runnning $(echo $installer | sed -e "s@$HOME@~@")"
	zsh "$installer"
done

echo -e "\n\033[1;32mThe dotfiles was installed successfully!\033[0m"
