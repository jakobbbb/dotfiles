#!/bin/sh

TEMPERATURE=3400

echo $1

if [ ! -z "$1" ]; then
    TEMPERATURE=$1
else
    f=$XDG_CONFIG_HOME/thm/redshift_temperature
    if [ -f "$f" ]; then
        TEMPERATURE=$(cat $f)
    fi
fi

redshift -PO $TEMPERATURE

# No redshift on tablet
TABLET=`xrandr --listactivemonitors | grep HDMI- | cut -d: -f1 | sed -e 's/ //g'`
if [[ ! -z "$TABLET" ]]; then
    redshift -m randr:crtc=$TABLET -x
fi
