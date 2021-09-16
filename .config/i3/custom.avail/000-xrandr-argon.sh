#!/bin/sh

TABLET_STYLUS=`xinput | grep "Tablet Monitor stylus" | sed -e "s/.*id=\(..\).*/\1/g"`
TABLET=`xinput | grep 'Tablet Monitor Pad pad' | sed -e "s/.*id=\(..\).*/\1/g"`

#xrandr --output DVI-D-0 --off
xrandr --output LVDS-1 --auto

if [ "$1" = "tablet" ]; then
    xrandr --output HDMI-1 --auto --$2 LVDS-1
elif [ "$1" = "tabletmirror" ]; then
    xrandr --output HDMI-1 --auto --same-as $2
elif [ "$1" = "notablet" ]; then
    xrandr --output HDMI-1 --off
fi

if [[ $1 = tablet* ]]; then
    xrandr --output HDMI-1 --rotate inverted
    xrandr --dpi 96
    xinput map-to-output $TABLET_STYLUS HDMI-1
    xinput set-prop $TABLET_STYLUS "Wacom Tablet Area" -89, 193, 58641, 32793
fi

xrdb ~/.Xresources
