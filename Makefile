SHELL = /bin/bash

install:	
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	ln -s ~/dotfiles/.vim ~/.vim
	. ./install-plugins.sh

uninstall:
	unlink ~/.vim
	unlink ~/.vimrc

update:
	. ./install-plugins.sh

clean:
	rm -f ~/.vimrc
	rm -rf ~/.vim
