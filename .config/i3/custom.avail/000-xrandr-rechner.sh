#!/bin/sh

set -x

SCREEN_LEFT=HDMI-0
SCREEN_RIGHT=DP-4

xrandr --output $SCREEN_LEFT --auto --scale 2x2 --pos 0x0
xrandr --output $SCREEN_RIGHT --primary --right-of $SCREEN_LEFT 
xrandr --output $SCREEN_RIGHT --pos 3840x0

~/.fehbg
