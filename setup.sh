#!/bin/bash

install_vimrc() {
        echo "Installing vimrc"
        if ! [ -f ~/.vim/autoload/plug.vim ]; then
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
        fi
        cp vim/vimrc $HOME/.vimrc;
}

install_tmux() {
        echo "Installing tmux.conf"
        cp tmux/tmux.conf $HOME/.tmux.conf;
}

install_vimrc;
install_tmux;
