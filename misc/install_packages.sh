#!/bin/bash

# Install all of my favorite packages, listed in packages.txt

PGKS=""

while read p; do
    grep -E "^#" <<< $p && PKGS="" || PKGS="$PKGS $p"
    grep -E "^$" <<< $p && echo "pacman --needed -S$PKGS"
done < packages.txt
