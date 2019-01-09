#!/bin/bash

update_vimrc() {
        mkdir -p $HOME/.config/nvim;
        cp nvim/init.vim $HOME/.config/nvim;
}

update_vimrc;
