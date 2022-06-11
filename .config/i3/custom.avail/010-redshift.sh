#!/bin/sh

redshift -PO 3400

# No redshift on tablet
TABLET=`xrandr --listactivemonitors | grep HDMI- | cut -d: -f1 | sed -e 's/ //g'`
if [[ ! -z "$TABLET" ]]; then
    redshift -m randr:crtc=$TABLET -x
fi
