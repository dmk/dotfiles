# better diffs
sudo pacman --noconfirm -S diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
