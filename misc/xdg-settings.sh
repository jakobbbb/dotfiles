#!/usr/bin/env bash

# Set a bunch of X settings.
# These settings persist, so this script only needs to be run once.

xdg-settings set default-web-browser firefox.desktop
xdg-mime default org.pwmt.zathura.desktop application/pdf
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/mp4
xdg-mime default org.gnome.eog.desktop image/png
xdg-mime default org.gnome.eog.desktop image/jpeg
xdg-mime default thunar.desktop inode/directory
xdg-mime default mpv-open.desktop x-scheme-handler/mpv
