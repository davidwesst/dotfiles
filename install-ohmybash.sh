#!/usr/bin/env bash

OMB_THEME="minimal-gh"

# download and install
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# set theme
sed -i "s/^OSH_THEME=\".*\"/OSH_THEME=\"$OMB_THEME\"/" ~/.bashrc

