#!/bin/sh

set -x

SCREEN_LEFT=DP-2
SCREEN_RIGHT=DP-3
SCREEN_TABLET=HDMI-1

TABLET_STYLUS=`xinput | grep "Tablet Monitor Pen stylus" | sed -e "s/.*id=\(..\).*/\1/g"`
TABLET=`xinput | grep 'Tablet Monitor Pad pad' | sed -e "s/.*id=\(..\).*/\1/g"`


if [ "$1" = "tablet" ]; then
    xrandr --output $SCREEN_TABLET --auto
    xrandr --output $SCREEN_TABLET --below $SCREEN_LEFT
elif [ "$1" = "tabletmirror" ]; then
    xrandr --output $SCREEN_TABLET --auto --same-as $2
elif [ "$1" = "notablet" ]; then
    xrandr --output $SCREEN_TABLET --off
elif [ -z "$1"]; then
    xrandr --output $SCREEN_RIGHT --auto --mode 1920x1080 -r 60 --primary --right-of $SCREEN_LEFT
    xrandr --output $SCREEN_LEFT --auto --mode 1920x1080 -r 60 --left-of $SCREEN_RIGHT
fi

if [[ $1 = tablet* ]]; then
    xrandr --dpi 96
    xinput map-to-output $TABLET_STYLUS $SCREEN_TABLET
    xinput set-prop $TABLET_STYLUS "Wacom Tablet Area" -89, 193, 58641, 32793
fi

xrdb ~/.Xresources
