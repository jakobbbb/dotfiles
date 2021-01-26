#!/bin/bash

# disable capslock
setxkbmap -option caps:none

# us international layout
setxkbmap us altgr-intl

# load xmodmap
xmodmap ~/.config/xmodmap
