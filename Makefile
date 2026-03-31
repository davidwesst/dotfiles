SHELL = /bin/bash
UNIX_VIM_HOME := $(HOME)/.vim
UNIX_VIMRC := $(HOME)/.vimrc

.PHONY: install vim-install vim-uninstall update vim-update clean

install: vim-install

vim-install:
	mkdir -p "$(UNIX_VIM_HOME)"
	cp -R vim/. "$(UNIX_VIM_HOME)/"
	cp .vimrc "$(UNIX_VIMRC)"

vim-uninstall:
	rm -f "$(UNIX_VIMRC)"
	rm -rf "$(UNIX_VIM_HOME)"

update: vim-update

vim-update:
	./install-plugins.sh

clean:
	rm -f "$(UNIX_VIMRC)"
	rm -rf "$(UNIX_VIM_HOME)"
	rm -f ~/.local/share/fonts/Cousine*.ttf
	rm -rf ~/.oh-my-bash/
	rm -rf ~/.asdf/
