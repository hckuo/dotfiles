#!/bin/bash

install_vimrc() {
        echo "Installing vimrc"
        if ! [ -f $HOME/.vim/autoload/plug.vim ]; then
            curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
        fi
        cp vim/vimrc $HOME/.vimrc;
}

install_tmux() {
        echo "Installing tmux.conf"
        cp tmux/tmux.conf $HOME/.tmux.conf;
}

install_oh_my_zsh() {
        echo "Installing oh-my-zsh"
        if ! [ -d $HOME/.oh-my-zsh ]; then
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        fi
        cp zsh/zshrc $HOME/.zshrc
}

install_vimrc
install_tmux
install_oh_my_zsh
