#!/usr/bin/env bash

# Set a bunch of X settings.
# These settings persist, so this script only needs to be run once.

xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop
xdg-mime default org.pwmt.zathura.desktop application/pdf
xdg-mime default mpv.desktop video/x-matroska
