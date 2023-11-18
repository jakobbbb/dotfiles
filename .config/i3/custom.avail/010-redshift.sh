#!/bin/sh

<<<<<<< HEAD
TEMPERATURE=3400

if [ ! -z "$1" ]; then
    TEMPERATURE=$1
else
    f=$XDG_CONFIG_HOME/thm/redshift_temperature
    if [ -f "$f" ]; then
        TEMPERATURE=$(cat $f)
    fi
fi

redshift -PO $TEMPERATURE > /dev/null
