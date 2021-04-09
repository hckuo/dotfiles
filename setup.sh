#!/bin/bash
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_vimrc() {
        echo "Installing vimrc"
        if ! [ -f $HOME/.vim/autoload/plug.vim ]; then
            curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
        fi
        ln -s $BASEDIR/vim/vimrc $HOME/.vimrc;
}

install_tmux() {
        if ! [ -d $HOME/.tmux/plugins/tpm ]; then
            git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        fi
        echo "Installing tmux.conf"
        ln -s $BASEDIR/tmux/tmux.conf $HOME/.tmux.conf;
}

install_oh_my_zsh() {
        echo "Installing oh-my-zsh"
        if ! [ -d $HOME/.oh-my-zsh ]; then
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
        fi
        rm $HOME/.zshrc
        ln -s $BASEDIR/zsh/zshrc $HOME/.zshrc
}

install_bash_it() {
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
    ln -s ./bash/inputrc ~/.inputrc
    bash_it enable alias git
    bash_it enable plugin extract
    bash_it enable plugin history
    bash_it enable plugin history_search
    bash_it enable completion ssh
    bash_it enable completion systemctl
    bash_it reload
}

rm -f $HOME/.zshrc $HOME/.tmux.conf $HOME/.vimrc
install_vimrc
install_tmux
#install_oh_my_zsh
install_bash_it
