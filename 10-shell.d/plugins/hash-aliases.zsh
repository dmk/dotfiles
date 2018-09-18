#!/bin/zsh

function hash-aliases:less-or-grep() {
    if [ -t 0 ]; then
        if [ $# -eq 1 ]; then
            less -RSFXw "${@}"
        else
            grep --color=auto "$2" "$1" "${@:3}"
        fi
    else
        if [ $# -eq 0 ]; then
            if [ -t 1 ]; then
                less -RSFXw
            else
                /bin/cat
            fi
        else
            grep --color=auto -iP "${@}"
        fi
    fi
}


function hash-aliases:sed-substitute() {
    local expression="$1"; shift

    sed -res"$expression" "${@}"
}


function hash-aliases:sed-delete() {
    local expression="$1"; shift

    sed -re"${expression}{d}" "${@}"
}


function hash-aliases:awk-print-field() {
    local args=()
    for arg in "${@}"; do
        if grep -xqE "[0-9]+" <<< "$arg"; then
            args+=("\$$arg")
        elif grep -qE "^ | $" <<< "$arg"; then
            args+=("\"${arg}\"")
        else
            args+=("${arg}")
        fi
    done

    awk "{print $args}"
}


function hash-aliases:tail-or-last() {
    if [ $# -gt 0 ]; then
        tail -n "${@:1}"
    else
        tail
    fi
}


function hash-aliases:head-or-first() {
    if [ $# -gt 0 ]; then
        head -n "${@:1}"
    else
        head
    fi
}

function hash-aliases:nth-line() {
    sed "${1}q;d"
}

function hash-aliases:cut-with-delimiter() {
    if grep -Eqx '[0-9,-]+' <<< $1; then
        cut -f "${@}"
    else
        cut -d "$1" -f "${@:2}"
    fi
}

function hash-aliases:xargs() {
    if  grep -qF '{}' <<< "${@}"; then
        xargs -n1 -I{} "${@}"
    else
        xargs -n1 "${@}"
    fi
}

function hash-aliases:xargs-sh() {
    local number_of_args=$1
    shift

    xargs -n$number_of_args sh -c "${@}" _
}

function hash-aliases:xargs-zsh() {
    local has_placeholder=false

    if [[ "$*" =~ '\{\}' ]]; then
        has_placeholder=true
    fi

    local args

    while read line; do
        args=()

        if $has_placeholder; then
            for arg in "$@"; do
                args+=("${arg//\{\}/$line}")
            done
        else
            args=("$@" "$line")
        fi

        eval "${(q)args[@]}"
    done
}

function hash-aliases:install() {
    alias -g --   '#'='| hash-aliases:less-or-grep'
    alias -g --  '#o'='| hash-aliases:less-or-grep -o'
    alias -g --  '#s'='| hash-aliases:sed-substitute'
    alias -g -- '#sd'='| hash-aliases:sed-delete'
    alias -g --  '#f'='| hash-aliases:awk-print-field'
    alias -g --  '#t'='| hash-aliases:tail-or-last'
    alias -g --  '#h'='| hash-aliases:head-or-first'
    alias -g --  '#n'='| hash-aliases:nth-line'

    alias -g --  '#x'='| hash-aliases:xargs'
    alias -g -- '#xn'="| hash-aliases:xargs -d$'\n'"
    alias -g -- '#xs'="| hash-aliases:xargs-sh"
    alias -g -- '#xz'="| hash-aliases:xargs-zsh"
    alias -g --  '#c'='| hash-aliases:cut-with-delimiter'

    alias -g -- '#td'='| tr -d'

    alias -g -- '#wc'='| wc -l'
    alias -g -- '#uc'='| uniq -c'
    alias -g -- '#u'="| awk '!x[\$0]++'"

    alias -g -- '#sn'='| sort -n'
    alias -g -- '#sr'='| sort -nr'

    alias -g -- '#tt'='tail -f'

    alias -g --  '##'='2>&1'
    alias -g --  '#.'='2>/dev/null'
}

hash-aliases:install
