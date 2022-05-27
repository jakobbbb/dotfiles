#!/bin/sh

TABLET_STYLUS=`xinput | grep "Tablet Monitor stylus" | sed -e "s/.*id=\(..\).*/\1/g"`
TABLET=`xinput | grep 'Tablet Monitor Pad pad' | sed -e "s/.*id=\(..\).*/\1/g"`

#xrandr --output DP-2 --off
xrandr --output DP-2 --mode 1920x1080 -r 60
xrandr --output DP-3 --mode 1920x1080 -r 144
xrandr --output DP-3 --primary
xrandr --output DP-2 --auto --left-of DP-3

if [ "$1" = "tablet" ]; then
    xrandr --output HDMI-0 --auto --below DP-2
elif [ "$1" = "tabletmirror" ]; then
    xrandr --output HDMI-0 --auto --same-as $2
elif [ "$1" = "notablet" ]; then
    xrandr --output HDMI-0 --off
fi

if [[ $1 = tablet* ]]; then
    xrandr --output HDMI-0 --rotate inverted
    xrandr --dpi 96
    xinput map-to-output $TABLET_STYLUS HDMI-0
    xinput set-prop $TABLET_STYLUS "Wacom Tablet Area" -89, 193, 58641, 32793
fi

xrdb ~/.Xresources
