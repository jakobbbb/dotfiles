#!/bin/bash
# very simple deploy script

items=".vimrc .vim .config .zshrc"

repodir=$(pwd)
cd ~
homedir=$(pwd)

mkdir $homedir/dotfiles_old

for item in $items; do
    ln -rs $repodir/$item $homedir/$item
done
