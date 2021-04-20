#!/usr/bin/env bash
#
# This is an example file. Don't use this for your custom scripts. Instead, create another file within the
# custom directory.
open() {
    xdg-open $@ > /dev/null 2>&1
}

alias cp="xclip -selection clipboard"
