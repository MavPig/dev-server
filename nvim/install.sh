#! /bin/bash

SCRIPT_DIR=`dirname "$(readlink -f "$0")"`

if [[ ! -e "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]]; then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	echo plug.vim installed!
else
	echo plug.vim already installed!
fi

if [[ ! -e "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim/init.vim ]]; then
	cp $SCRIPT_DIR/init.vim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim
	echo init.vim installed!
else 
	echo init.vim already installed!

fi


