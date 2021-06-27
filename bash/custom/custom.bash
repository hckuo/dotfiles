#!/usr/bin/env bash
#
# This is an example file. Don't use this for your custom scripts. Instead, create another file within the
# custom directory.
open() {
    xdg-open $@ > /dev/null 2>&1
}

alias clipboard='xclip -selection clipboard'
# make tab cycle through commands after listing
bind '"\t":menu-complete'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"
export FZF_DEFAULT_COMMAND='rg --files'
