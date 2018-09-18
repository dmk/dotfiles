# exa is a better ls tool
if which exa >/dev/null 2>&1; then
	alias ls='exa'
	alias l='exa -la --git'
	alias la='exa -laa --git'
	alias ll='exa -l --git'
else
	alias ls="ls -F --color"
	alias l="ls -lAh"
	alias la="ls -A"
	alias ll="ls -l"
fi

alias grep="grep --color=auto"
alias less="less -r"

# quick hack to make watch work with aliases
alias watch='watch '

alias cat="bat --theme=TwoDark --paging=never"
alias http="http --style=monokai"
alias reload!='exec "$SHELL" -l'

alias dc="docker-compose"
alias d="docker"

if (( $+commands[grc] )); then
	# Supported commands
	cmds=(
		log ip ping ulimit tcpdump netstat fdisk ifconfig id ipaddr env whois \
		diff ntpdate iptables free lspci lsattr lsblk lsmod stat mount dig ps \
		gcc nmap ping ps uptime iproute iwconfig df du traceroute systemctl
	)

	# Set alias for available commands.
	for cmd in $cmds; do
		if (( $+commands[$cmd] )); then
			alias $cmd="grc --colour=auto $(whence $cmd)"
		fi
	done

	alias './configure'="grc --colour=auto ./configure"

	# Clean up variables
	unset cmds cmd
fi
