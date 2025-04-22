#!/bin/sh

set -x

SCREEN_LEFT=DP-2
SCREEN_RIGHT=DP-4

xrandr --output $SCREEN_LEFT --auto
xrandr --output $SCREEN_RIGHT --auto
xrandr --output $SCREEN_RIGHT --primary --right-of $SCREEN_LEFT

~/.fehbg
