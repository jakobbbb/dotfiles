#!/bin/sh

SCREEN_LEFT=DP-3
SCREEN_RIGHT=DP-2
SCREEN_TABLET=HDMI-1

TABLET_STYLUS=`xinput | grep "Tablet Monitor stylus" | sed -e "s/.*id=\(..\).*/\1/g"`
TABLET=`xinput | grep 'Tablet Monitor Pad pad' | sed -e "s/.*id=\(..\).*/\1/g"`

xrandr --output $SCREEN_RIGHT --auto --mode 1920x1080 -r 60 --primary
xrandr --output $SCREEN_LEFT --auto --mode 1920x1080 -r 60 --left-of $SCREEN_RIGHT
xrandr --output $SCREEN_LEFT --primary

if [ "$1" = "tablet" ]; then
    xrandr --output $SCREEN_TABLET --auto --below $SCREEN_LEFT
elif [ "$1" = "tabletmirror" ]; then
    xrandr --output $SCREEN_TABLET --auto --same-as $2
elif [ "$1" = "notablet" ]; then
    xrandr --output $SCREEN_TABLET --off
fi

if [[ $1 = tablet* ]]; then
    xrandr --output $SCREEN_TABLET --rotate inverted
    xrandr --dpi 96
    xinput map-to-output $TABLET_STYLUS $SCREEN_TABLET
    xinput set-prop $TABLET_STYLUS "Wacom Tablet Area" -89, 193, 58641, 32793
fi

xrdb ~/.Xresources
