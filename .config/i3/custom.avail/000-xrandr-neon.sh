#!/bin/sh

#xrandr --output DVI-D-0 --off
xrandr --output DVI-D-0 --mode 1920x1080 -r 60
xrandr --output DVI-I-1 --mode 1920x1080 -r 144
xrandr --output DVI-D-0 --auto --left-of DVI-I-1
