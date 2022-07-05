#!/usr/bin/bash

#
#   Plugin DIR format
#       ~/.vim/pack/vendor/start/<plugin_name>
#

install_or_update() {
	DIR=$1
	REPO=$2

	if [ -d $DIR ] 
	then
		pushd $DIR 1> /dev/null
		git pull --ff-only $REPO
		popd 1> /dev/null
	else
		mkdir -p $DIR 
		git clone $REPO $DIR 
	fi
}

# NERDTree
NERDTREE_DIR=~/.vim/pack/vendor/start/nerd_tree
NERDTREE_REPO=https://github.com/preservim/nerdtree.git

install_or_update $NERDTREE_DIR $NERDTREE_REPO

# vim-airline
AIRLINE_DIR=~/.vim/pack/vendor/start/vim-airline
AIRLINE_REPO=https://github.com/vim-airline/vim-airline

install_or_update $AIRLINE_DIR $AIRLINE_REPO
