#!/bin/bash

install_vimrc() {
        echo "Installing vimrc"
        cp vim/vimrc $HOME/.vimrc;
}

install_tmux() {
        echo "Installing tmux.conf"
        cp tmux/tmux.conf $HOME/.tmux.conf;
}

install_vimrc;
install_tmux;
