#!/usr/bin/bash

YELLOW='\033[0;33m'
RESET='\033[0m'

install_fonts() {
	FONT_DIR=~/.dotfiles/fonts
	INSTALL_DIR=~/.local/share/fonts

	if command -v fc-cache >/dev/null 2>&1; then
		mkdir -p $INSTALL_DIR
		cp --recursive --link --update $FONT_DIR/Cousine/*.ttf $INSTALL_DIR
		fc-cache -rv
	else
		echo -e "${YELLOW}[Warning]${RESET} Unable to find fc-cache command. Fonts not installed. Please install fontconfig to enable fc-cache and install fonts."
	fi

}

install_fonts

