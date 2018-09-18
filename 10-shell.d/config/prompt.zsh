# Color definitions
local T_COLOR_PROMPT="blue"
local T_COLOR_ROOT=""
local T_COLOR_DIR="red"
local T_COLOR_EXIT_VALUE="cyan"

# Symbol definitions
local T_SYMBOL_ROOT=${T_SYMBOL_ROOT-"▲"}
local T_SYMBOL_PROMPT=${T_SYMBOL_PROMPT-"▲"}
local T_SYMBOL_EXIT_VALUE=${T_SYMBOL_EXIT_VALUE-"△"}

# Misc configurations
local T_PROMPT_PREFIX_SPACER=${T_PROMPT_PREFIX_SPACER-" "}

local T_DIR_SPACER=${T_DIR_SPACER-""}
local T_SYMBOL_SPACER=${T_SYMBOL_SPACER-" "}

local T_PROMPT_PATH=${T_PROMPT_PATH:-"%3~"}

# Define how to colorize before the variables
prompt_colorize() {
	echo "%F{$1}$2%f"
}

geometry_prompt_path_setup() {
	# Combine color and symbols
	T_EXIT_VALUE=$(prompt_colorize $T_COLOR_EXIT_VALUE $T_SYMBOL_EXIT_VALUE)
	T_PROMPT=$(prompt_colorize $T_COLOR_PROMPT $T_SYMBOL_PROMPT)
}

prompt_render() {
	local prompt_symbol=""

	if [ $? -eq 0 ] ; then
		prompt_symbol=$T_SYMBOL_PROMPT
	else
		prompt_symbol=$T_SYMBOL_EXIT_VALUE
	fi

	if [[ $UID == 0 || $EUID == 0 ]]; then
		T_PROMPT=$(prompt_colorize $T_COLOR_ROOT $T_SYMBOL_ROOT)
	fi

	local dir=$T_PROMPT_PATH
	if [ $PWD = $HOME ]; then
		dir="~"
	else
		dir=$(basename $PWD)
	fi

	local colorized_prompt_symbol="%(?.$T_PROMPT.$T_EXIT_VALUE)"
	local colorized_prompt_dir="%F{$T_COLOR_DIR}$dir%f"

	PROMPT="$colorized_prompt_symbol $colorized_prompt_dir $T_PROMPT_SUFFIX$PROMPT_T_PRIMARY_SUFFIX"
}

prompt_setup() {
	autoload -U add-zsh-hook
	add-zsh-hook precmd prompt_render
}

prompt_setup
