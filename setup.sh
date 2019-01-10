#!/bin/bash

install_vimrc() {
        echo "Installing vimrc"
        mkdir -p $HOME/.config/nvim;
        cp nvim/init.vim $HOME/.config/nvim;
}

install_tmux() {
        echo "Installing tmux.conf"
        cp tmux/tmux.conf $HOME/.tmux.conf;
}

install_vimrc;
install_tmux;
