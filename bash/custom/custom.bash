#!/usr/bin/env bash
#
# This is an example file. Don't use this for your custom scripts. Instead, create another file within the
# custom directory.
open() {
    xdg-open $@ > /dev/null 2>&1
}

alias clipboard='xclip -selection clipboard'
export FZF_DEFAULT_COMMAND='rg --files'
export EDITOR='nvim'
alias vim='nvim'
