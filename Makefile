SHELL = /bin/bash
UNIX_VIM_HOME := $(HOME)/.vim
UNIX_VIMRC := $(HOME)/.vimrc

.PHONY: install vim-install vim-uninstall update vim-update clean

install: vim-install

vim-install:
	@if [ -d "$(UNIX_VIM_HOME)" ] || [ -f "$(UNIX_VIMRC)" ]; then \
		echo "Existing Vim config detected. Refreshing files and checking plugins..."; \
	else \
		echo "Installing Vim configuration into $(UNIX_VIM_HOME)..."; \
	fi
	mkdir -p "$(UNIX_VIM_HOME)"
	@echo "Copying shared Vim files..."
	cp -R vim/. "$(UNIX_VIM_HOME)/"
	@echo "Writing $(UNIX_VIMRC)..."
	cp .vimrc "$(UNIX_VIMRC)"
	@echo "Installing or updating Vim plugins..."
	VIM_HOME="$(UNIX_VIM_HOME)" ./install-plugins.sh
	@echo "Vim install completed successfully."

vim-uninstall:
	rm -f "$(UNIX_VIMRC)"
	rm -rf "$(UNIX_VIM_HOME)"

update: vim-update

vim-update:
	./install-plugins.sh

clean:
	rm -f "$(UNIX_VIMRC)"
	rm -rf "$(UNIX_VIM_HOME)"
	rm -rf ~/.oh-my-bash/
	rm -rf ~/.asdf/
