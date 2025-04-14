#!/bin/bash

# disable capslock
setxkbmap -option caps:none

# us international layout
setxkbmap us altgr-intl

# load xmodmap
if [ "$1" != "noxmodmap" ]; then
    xmodmap ~/.config/xmodmap
fi

# disable touchpad
toggle-touchpad disable
>>>>>>> 95a09e0 (Disable touchpad)
