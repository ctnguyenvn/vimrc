#!/usr/bin/bash

ERROR=$'\e[1;31m'
WARNING=$'\e[1;33m'
SUCCESS=$'\e[1;32m'
NORMAL=$'\e[0m'

trap clean 1 2 3 6


command_exists() {
	type "$1" &>/dev/null
}


function set_roodir(){
	# set neovim directory
	OS="$(uname -s)"

	if [ "$UID" -eq 0 ]; then
		NEOVIM_DIR="/root/.config/nvim"
	else
		case "$OS" in
		Linux*)
			NEOVIM_DIR="/home/$USER/.config/nvim"
			;;
		Darwin*)
			NEOVIM_DIR="/Users/$USER/.config/nvim"
			;;
		*)
			printf "${ERROR}[x] %s${NORMAL}\n" "Install failed"
			exit 1
			;;
		esac

	fi
}


# Install neovim stable version
# With ubuntu required install neovim stable version
# $ sudo add-apt-repository ppa:neovim-ppa/stable
# $ sudo apt-get update
# $ sudo apt-get install neovim
function neovim_check_and_install(){
	if ! command_exists nvim; then
		printf "[x] Neovim is not installed\n"
		printf "[+] Installing neovim\n"
		case "$OS" in
			Linux*)
				if [[ -x $(which pacman) ]]; then
					sudo pacman -S neovim
				elif [[ -x $(which yum) ]]; then
					sudo yum install neovim -y
				elif [[ -x $(which apt) ]]; then
					sudo add-apt-repository ppa:neovim-ppa/stable
					sudo apt update -y
					sudo apt install neovim -y
				else
	        		printf "${ERROR}[x] %s${NORMAL}\n" "Neovim is not installed in your OS"
	        		exit 1
	    		fi
				;;
			Darwin*)
				sudo brew install neovim
				;;
		esac
	fi
}


function setup_depence(){
	# Install python & modules
	if [[ -x $(which pacman) ]]; then
		sudo pacman -S python-pynvim
	elif [[ -x $(which yum) ]]; then
		sudo yum update -y
		sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
		sudo yum install -y python3-neovim nodejs npm
	elif [[ -x $(which apt) ]]; then
		sudo apt install python3-neovim nodejs npm -y
		sudo apt install python-dev python-pip python3-dev python3-pip python3-setuptools -y
	else
		printf "${ERROR}[x] %s${NORMAL}\n" "Failed install dependention package"
		exit 1
	fi
}


clean() {
    mv "$NEOVIM_DIR""_backup" "$NEOVIM_DIR"
    printf "${ERROR}[x] %s${NORMAL}\n" "Install failed"
    exit 1
}


function setup() {
	# install vim-plug plugin
	printf "${NORMAL}[+] %s${NORMAL}\n" "Install vim-plug plugin..."
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


	# copy config
	printf "${NORMAL}[+] %s${NORMAL}\n" "Copy init file..."
	cp -v init.vim "$NEOVIM_DIR"


	# Install plugin
	printf "${NORMAL}[+] %s{$NORMAL}\n" "Install plugin for neovim"
	nvim +PlugInstall +qall


	printf "${NORMAL}[+] %s${NORMAL}\n" "Copy config file..."
	cp -r settings "$NEOVIM_DIR"
	cp -r plugins "$NEOVIM_DIR"
}


main() {
    printf "${NORMAL}%s${NORMAL}\n" "=============================================="
    printf "${NORMAL}%s${NORMAL} ${SUCCESS}%s ${NORMAL}%s\n" "======== " "Neovim config start installing..." " ======"
    printf "${NORMAL}%s${NORMAL}\n" "=============================================="

	set_roodir
	neovim_check_and_install
	setup_depence

    if [ -d "$NEOVIM_DIR" ]; then
        printf "${WARNING}==> %s${NORMAL}\n" "Neovim config exits"
        printf "${NORMAL}[-] %s${NORMAL}\n" "Backup neovim config file..."
        mv -v "$NEOVIM_DIR" "$NEOVIM_DIR""_backup"
    fi
    mkdir -p "$NEOVIM_DIR"
    setup
    printf "${SUCCESS}[+] %s${NORMAL}\n" "Complete !!!"
    printf "${WARNING}==> %s${NORMAL}\n" "Please go to https://github.com/williamboman/nvim-lsp-installer for install docs plugin/language"
}

main
