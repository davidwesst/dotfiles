SHELL = /bin/bash

install:	
	ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
	ln -s ~/.dotfiles/vim ~/.vim
	. ./install-plugins.sh
	. ./install-fonts.sh
	. ./install-asdf.sh

uninstall:
	unlink ~/.vim
	unlink ~/.vimrc

update:
	. ./install-plugins.sh

clean:
	rm -f ~/.vimrc
	rm -rf ~/.vim
	rm -f ~/.local/share/fonts/Cousine*.ttf
	rm -rf ~/.asdf/
