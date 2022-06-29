#!/usr/bin/bash

#
#   Plugin DIR format
#       ~/.vim/pack/vendor/start/<plugin_name>
#

# NERDTree
NERDTREE_DIR=~/.vim/pack/vendor/start/nerd_tree
NERDTREE_REPO=https://github.com/preservim/nerdtree.git

if [ -d $NERDTREE_DIR ] 
then
    pushd $NERDTREE_DIR
    git pull --ff-only $NERDTREE_REPO
    popd
else
    mkdir -p $NERDTREE_DIR 
    git clone $NERDTREE_REPO $NERDTREE_DIR 
fi

# vim-airline
AIRLINE_DIR=~/.vim/pack/vendor/start/vim-airline
AIRLINE_REPO=https://github.com/vim-airline/vim-airline

if [ -d $AIRLINE_DIR ] 
then
    pushd $AIRLINE_DIR 
    git pull --ff-only $AIRLINE_REPO 
    popd
else
    mkdir -p $AIRLINE_DIR 
    git clone $AIRLINE_REPO $AIRLINE_DIR 
fi
