#!/bin/bash -i
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_vimrc() {
    echo "Installing vimrc"
    if ! [ -f $HOME/.vim/autoload/plug.vim ]; then
        curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
    fi
    ln -s $BASEDIR/vim/vimrc $HOME/.vimrc;
}

install_neovim() {
    echo "Installing neovim"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    mkdir -p ~/.config/nvim
    rm ~/.config/nvim/init.vim
    ln -s $BASEDIR/nvim/init.vim $HOME/.config/nvim/init.vim
}

install_tmux() {
    rm ~/.tmux.conf
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
    rm -rf ~/.bashrc ~/.bash_it
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    bash ~/.bash_it/install.sh
    ln -s ./bash/inputrc ~/.inputrc
    sed -i 's/export BASH_IT_THEME=.*/export BASH_IT_THEME=simple/' ~/.bashrc
    . ~/.bashrc
    bash_it enable alias git
    bash_it enable plugin extract
    bash_it enable plugin history
    bash_it enable plugin history_search
    bash_it enable completion ssh
    bash_it enable completion systemctl
    ln -s bash/custom/custom.bash ~/.bash_it/custom/custom.bash
}

install_neovim
install_tmux
#install_oh_my_zsh
install_bash_it
