#!/bin/zsh

export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

fpath=($ZHOME/functions $fpath)

autoload -U "$ZHOME"/functions/*(:t)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP

# allow functions to have local options
setopt LOCAL_OPTIONS

# allow functions to have local traps
setopt LOCAL_TRAPS

# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD

# adds history
setopt APPEND_HISTORY

# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST

# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# emacs mode
bindkey -e

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# to to the beggining/end of line with home/end
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word
bindkey '^[[3~' backward-delete-word

# search history with fzf if installed, default otherwise
if test -f /usr/share/fzf/key-bindings.zsh; then
	# shellcheck disable=SC1091
	. /usr/share/fzf/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi

zle -N matrix
bindkey '^[l' matrix

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
