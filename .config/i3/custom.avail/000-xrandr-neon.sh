#!/bin/sh

#xrandr --output DVI-D-0 --off
xrandr --output DVI-D-0 --mode 1920x1080 -r 60
xrandr --output DVI-I-1 --mode 1920x1080 -r 144
xrandr --output DVI-D-0 --auto --left-of DVI-I-1

if [ "$1" = "tablet" ]; then
    xrandr --output HDMI-0 --auto --below DVI-D-0
    xrandr --output HDMI-0 --rotate inverted
    xrandr --dpi 96
    xrdb ~/.Xresources
    xinput map-to-output `xinput | grep "Tablet Monitor stylus" | sed -e "s/.*id=\(..\).*/\1/g"` HDMI-0
elif [ "$1" = "notablet" ]; then
    xrandr --output HDMI-0 --off
fi
