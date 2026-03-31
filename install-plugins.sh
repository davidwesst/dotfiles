#!/bin/bash

set -euo pipefail

#
#   Plugin DIR format
#       ~/.vim/pack/vendor/start/<plugin_name>
#

VIM_HOME="${VIM_HOME:-$HOME/.vim}"
PLUGIN_ROOT="${VIM_HOME}/pack/vendor/start"

install_or_update() {
	local name=$1
	local dir=$2
	local repo=$3
	local before_ref
	local after_ref

	if [ -d "$dir/.git" ]; then
		echo "Checking ${name}..."
		pushd "$dir" > /dev/null
		before_ref="$(git rev-parse HEAD)"
		git pull --ff-only > /dev/null
		after_ref="$(git rev-parse HEAD)"
		popd 1> /dev/null

		if [ "$before_ref" = "$after_ref" ]; then
			echo "${name} is already up to date."
		else
			echo "${name} was updated."
		fi
	else
		echo "Installing ${name}..."
		mkdir -p "$(dirname "$dir")"
		git clone "$repo" "$dir" > /dev/null
		echo "${name} was installed."
	fi
}

# NERDTree
NERDTREE_DIR="${PLUGIN_ROOT}/nerd_tree"
NERDTREE_REPO=https://github.com/preservim/nerdtree.git

install_or_update "NERDTree" "$NERDTREE_DIR" "$NERDTREE_REPO"

# vim-airline
AIRLINE_DIR="${PLUGIN_ROOT}/vim-airline"
AIRLINE_REPO=https://github.com/vim-airline/vim-airline

install_or_update "vim-airline" "$AIRLINE_DIR" "$AIRLINE_REPO"

# vim-polyglot
POLYGLOT_DIR="${PLUGIN_ROOT}/vim-polyglot"
POLYGLOT_REPO=https://github.com/sheerun/vim-polyglot

install_or_update "vim-polyglot" "$POLYGLOT_DIR" "$POLYGLOT_REPO"
