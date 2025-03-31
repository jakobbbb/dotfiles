#!/bin/sh

set -x

SCREEN_LEFT=DP-2
SCREEN_RIGHT=DP-4

xrandr --output $SCREEN_LEFT --mode 3840x2160
xrandr --output $SCREEN_RIGHT --mode 3840x2160 --primary --right-of $SCREEN_LEFT

~/.fehbg
