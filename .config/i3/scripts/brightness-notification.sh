#!/bin/sh

# Show the current xbacklight brightness in a notification.
TIMEOUT=600
ID=2527269
PRIO="low"
MESSAGE="Backlight: $(echo "$(xbacklight -get)/1" | bc)%"

dunstify -t $TIMEOUT -r $ID -u $PRIO "$MESSAGE"
