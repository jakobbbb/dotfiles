#!/bin/sh

set -x

SCREEN_LEFT=DisplayPort-1
SCREEN_RIGHT=DisplayPort-2
SCREEN_TABLET=HDMI-A-0

TABLET_STYLUS=`xinput | grep "Tablet Monitor Pen stylus" | sed -e "s/.*id=\(..\).*/\1/g"`
TABLET=`xinput | grep 'Tablet Monitor Pad pad' | sed -e "s/.*id=\(..\).*/\1/g"`


if [ "$1" = "tablet" ]; then
    xrandr --output $SCREEN_TABLET --auto
    xrandr --output $SCREEN_TABLET --below $SCREEN_RIGHT
    ~/.fehbg
elif [ "$1" = "tabletmirror" ]; then
    xrandr --output $SCREEN_TABLET --auto --same-as $2
    ~/.fehbg
elif [ "$1" = "notablet" ]; then
    xrandr --output $SCREEN_TABLET --off
elif [ -z "$1"]; then
    xrandr --output $SCREEN_RIGHT --auto --mode 2560x1440 -r 120 --primary --right-of $SCREEN_LEFT
    xrandr --output $SCREEN_LEFT --auto --mode 1920x1080 -r 60 --left-of $SCREEN_RIGHT
fi

if [[ $1 = tablet* ]]; then
    xrandr --dpi 96
    xinput map-to-output $TABLET_STYLUS $SCREEN_TABLET
    xinput set-prop $TABLET_STYLUS "Wacom Tablet Area" -546 278 58042 33183
fi

xrdb ~/.Xresources
