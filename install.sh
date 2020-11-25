#!/bin/bash

if [ "$UID" -eq 0 ]; then
    VIM_DIR="/root/.vim"
    VIM_FILE="/root/.vimrc"
else
    VIM_DIR="/home/$USER/.vim"
    VIM_FILE="/home/$USER/.vimrc"
fi

trap clean 1 2 3 6

clean() {
    mv $VIM_DIR"_backup" $VIM_DIR
    mv $VIM_FILE"_backup" $VIM_FILE
    echo "Error !!!"
    exit 1
}

setup() {
    echo "Copy config file..."
    cp -v vimrc "$VIM_FILE"

    echo "Clone vundle plugin..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VIM_DIR"/bundle/Vundle.vim

    echo "Install Plugin..."
    vim +PluginInstall +qall
}

main() {
    echo "=============================================="
    echo "======== Vim config start installing... ======"
    echo "=============================================="
    if [ -d "$VIM_DIR" ] || [ -f "$VIM_FILE" ]; then
        echo "vim config file exits"
        echo "Backup vim config file..."
        mv -v "$VIM_DIR" "$VIM_DIR""_backup"
        mv -v "$VIM_FILE" "$VIM_FILE""_backup"
    fi
    mkdir "$VIM_DIR"
    setup
    echo "Complete !!!"
    echo "Please remove \" before Plugin and using :PluginInstall to install more plugin you want"
}
main
