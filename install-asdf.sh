#!/usr/bin/env bash


ASDF_REPO='https://github.com/asdf-vm/asdf.git'
ASDF_VERSION='v0.15.0'
ASDF_INSTALL="$HOME/.asdf"

git clone $ASDF_REPO $ASDF_INSTALL --branch $ASDF_VERSION

# The lines to add to .bashrc
LINE1=". \$HOME/.asdf/asdf.sh"
LINE2=". \$HOME/.asdf/completions/asdf.bash"

# Check LINE1 before adding it
if ! grep -Fxq "$LINE1" ~/.bashrc; then
  echo "$LINE1" >> ~/.bashrc
fi

# Check LINE2 before adding it
if ! grep -Fxq "$LINE2" ~/.bashrc; then
  echo "$LINE2" >> ~/.bashrc
fi

# refresh terminal
source ~/.bashrc

# Setup plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add rust https://github.com/code-lever/asdf-rust.git

asdf install nodejs latest
asdf global nodejs latest

asdf install rust latest
asdf global rust latest

