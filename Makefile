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
	@if [ "$$(cd vim && pwd -P)" = "$$(cd "$(UNIX_VIM_HOME)" && pwd -P)" ]; then \
		echo "$(UNIX_VIM_HOME) already points to this repo; skipping file copy."; \
	else \
		cp -R vim/. "$(UNIX_VIM_HOME)/"; \
	fi
	@echo "Writing $(UNIX_VIMRC)..."
	@if [ "$$(cd "$$(dirname .vimrc)" && pwd -P)/$$(basename .vimrc)" = "$$(cd "$$(dirname "$(UNIX_VIMRC)")" && pwd -P)/$$(basename "$(UNIX_VIMRC)")" ]; then \
		echo "$(UNIX_VIMRC) already points to this repo; skipping vimrc copy."; \
	else \
		cp .vimrc "$(UNIX_VIMRC)"; \
	fi
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
