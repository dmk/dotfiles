#!/bin/zsh

GEOMETRY_PROMPT_PREFIX="" # remove extra newline

# GEOMETRY_PROMPT_BASENAME=true
GEOMETRY_PROMPT_PLUGINS="git hydrate"

# Prompt theming

GEOMETRY_COLOR_EXIT_VALUE="red"             # prompt symbol color when exit
GEOMETRY_COLOR_PROMPT="green"               # prompt symbol color
GEOMETRY_COLOR_ROOT="yellow"                # root prompt symbol color
GEOMETRY_COLOR_DIR="blue"                   # current directory color

GEOMETRY_SYMBOL_PROMPT="α"                  # default prompt symbol
GEOMETRY_SYMBOL_RPROMPT="…"               # multiline prompts
GEOMETRY_SYMBOL_EXIT_VALUE="α"              # displayed when exit value is != 0
GEOMETRY_SYMBOL_ROOT="ρ"                    # when logged in user is root

# Plugins

# Git plugin

GEOMETRY_SYMBOL_GIT_DIRTY="◉"               # when repo has "dirty" state
GEOMETRY_SYMBOL_GIT_CLEAN="●"               # when repo has "clean" state
GEOMETRY_SYMBOL_GIT_BARE="◌"                 # when repo is bare (no working tree)
GEOMETRY_SYMBOL_GIT_REBASE="◙"			    # when in middle of rebase
GEOMETRY_SYMBOL_GIT_UNPUSHED="△"            # when there are unpushed changes
GEOMETRY_SYMBOL_GIT_UNPULLED="▽"            # when there are unpulled changes
GEOMETRY_SYMBOL_GIT_CONFLICTS_SOLVED="•"    # when all conflicts have been solved
GEOMETRY_SYMBOL_GIT_CONFLICTS_UNSOLVED="◦"  # when there are still unsolved conflicts

PROMPT_GEOMETRY_GIT_TIME_SHOW_EMPTY=false
PROMPT_GEOMETRY_GIT_TIME=false
PROMPT_GEOMETRY_GIT_CONFLICTS=true

# Hydrate plugin

GEOMETRY_PLUGIN_HYDRATE_COLOR=blue
GEOMETRY_PLUGIN_HYDRATE_SYMBOL="ﭧ"
GEOMETRY_PLUGIN_HYDRATE_INTERVAL=1
GEOMETRY_PLUGIN_HYDRATE_BINDKEY='^H'
