#!/bin/bash

# disable capslock
setxkbmap -option caps:none

# start dropbox
dropbox start &

# xrandr config
if [ "$HOSTNAME" = jbr-ubuntu ]; then
    xrandr --output DVI-D-1 --primary
    xrandr --output DVI-D-1 --left-of DVI-I-1
    xrandr --output DVI-D-1 --mode 1920x1080 --rate 144
fi
