#!/bin/sh

set -x

SCREEN_LEFT=DP-0
SCREEN_RIGHT=DP-4

xrandr --output $SCREEN_LEFT --auto
xrandr --output $SCREEN_RIGHT --auto --right-of $SCREEN_LEFT

~/.fehbg
