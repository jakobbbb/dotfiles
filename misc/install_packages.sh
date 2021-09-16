#!/bin/bash

# Install all of my favorite packages, listed in packages.txt

PGKS=""

while read p; do
    grep -E "^#" <<< $p && PKGS="" || PKGS="$PKGS $p"
done < packages.txt

yay --needed -S$PKGS
