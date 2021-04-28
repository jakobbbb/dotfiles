#!/bin/sh

redshift -PO 3400

TABLET=`xrandr --listactivemonitors | grep HDMI-0 | cut -d: -f1`
redshift -m randr:crtc=$TABLET -x
