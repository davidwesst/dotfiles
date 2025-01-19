#!/usr/bin/bash

install_fonts() {
	FONT_DIR=~/.dotfiles/fonts
	INSTALL_DIR=~/.local/share/fonts

	mkdir -p $INSTALL_DIR
	cp --recursive --link --update $FONT_DIR/Cousine/*.ttf $INSTALL_DIR
	fc-cache -rv
}

install_fonts

