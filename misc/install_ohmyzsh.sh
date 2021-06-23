#!/usr/bin/bash

set -e

INSTALLER=/tmp/install_ohmyzsh.sh

curl -o $INSTALLER -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
chmod +x $INSTALLER
sed -i "s/--depth=1//g" $INSTALLER
RUNZSH=no $INSTALLER
cd ~/.oh-my-zsh
git revert c66d8a841d231895be37721220f23b537d90c5a5
rm $INSTALLER

rm ~/.zshrc
cd ~/dotfiles
./deploy.py
