install: clean
	ln -s ~/dotfiles/.vimrc ~/.vimrc
	ln -s ~/dotfiles/.vim ~/.vim

clean:
	rm -f ~/.vimrc
	rm -rf ~/.vim
