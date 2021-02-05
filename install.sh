#!/bin/bash

ERROR=$'\e[1;31m'
WARNING=$'\e[1;33m'
SUCCESS=$'\e[1;32m'
NORMAL=$'\e[0m'

OS="$(uname -s)"

if [ "$UID" -eq 0 ]; then
    VIM_DIR="/root/.vim"
    VIM_FILE="/root/.vimrc"
else
    case "$OS" in
    Linux*)
        VIM_DIR="/home/$USER/.vim"
        VIM_FILE="/home/$USER/.vimrc"
        ;;
    Darwin*)
        VIM_DIR="/Users/$USER/.vim"
        VIM_FILE="/Users/$USER/.vimrc"
        ;;
    *)
        printf "${ERROR}[x] %s${NORMAL}\n" "Install failed"
        exit -1
        ;;
    esac

fi

if [[ -x $(command -v vim) ]]; then
    printf "${SUCCESS}[+] ${NORMAL}%s\n" "Vim: $(vim --version | head -n 1)"
    type -a vi 2>/dev/null
    if [[ "$?" -eq 1 ]];
    then
        echo "alias vi=\'vim\'" >> ~/.bashrc
    fi
else
    printf "${WARNING}[?] %s${NORMAL}" "vim text editer not installed in your OS\nInstalling..."
    if [[ -x $(which -v yum) ]]; then
        sudo yum install vim -y
    elif [[ -x $(which -v apt) ]]; then
        sudo apt install vim -y
    else
        printf "${ERROR}[x] %s${NORMAL}\n" "Vim is not installed in your OS"
        exit -1
    fi
fi

trap clean 1 2 3 6

clean() {
    mv $VIM_DIR"_backup" $VIM_DIR
    mv $VIM_FILE"_backup" $VIM_FILE
    printf "${ERROR}[x] %s${NORMAL}\n" "Install failed"
    exit -1
}

setup() {
    printf "${NORMAL}[-] %s${NORMAL}\n" "Copy config file..."
    cp -v vimrc "$VIM_FILE"

    printf "${NORMAL}[-] %s${NORMAL}\n" "Clone vundle plugin..."
    git clone https://github.com/VundleVim/Vundle.vim.git "$VIM_DIR"/bundle/Vundle.vim

    printf "${NORMAL}[-] %s${NORMAL}\n" "Install Plugin..."
    vim +PluginInstall +qall

    printf "${NORMAL}[+] %s${NORMAL}\n" "Enable new theme"
    sed -i 's/\"colorscheme gruvbox/colorscheme gruvbox/g' $VIM_FILE
}

main() {
    printf "${NORMAL}%s${NORMAL}\n" "=============================================="
    printf "${NORMAL}%s${NORMAL} ${SUCCESS}%s ${NORMAL}%s\n" "======== " "Vim config start installing..." " ======"
    printf "${NORMAL}%s${NORMAL}\n" "=============================================="
    if [ -d "$VIM_DIR" ] || [ -f "$VIM_FILE" ]; then
        printf "${WARNING}==> %s${NORMAL}\n" "vim config file exits"
        printf "${NORMAL}[-] %s${NORMAL}\n" "Backup vim config file..."
        mv -v "$VIM_DIR" "$VIM_DIR""_backup"
        mv -v "$VIM_FILE" "$VIM_FILE""_backup"
    fi
    mkdir "$VIM_DIR"
    setup
    printf "${SUCCESS}[+] %s${NORMAL}\n" "Complete !!!"
    printf "${WARNING}==> %s${NORMAL}\n" "Please install ctags for tagbar plugin"
    printf "${WARNING}==> %s${NORMAL}\n" "Please remove \" before Plugin (in config file) and using :PluginInstall to install more plugin you want"
}
main
