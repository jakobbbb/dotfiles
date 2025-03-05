#!/bin/sh

set -x

SCREEN_LEFT=DP-0
SCREEN_RIGHT=DP-4

xrandr --output $SCREEN_LEFT --mode 2560x1440 --scale 1.5x1.5 --pos 0x0
xrandr --output $SCREEN_RIGHT --mode 3840x2160 --primary --right-of $SCREEN_LEFT 
xrandr --output $SCREEN_RIGHT --pos 3840x0

~/.fehbg
