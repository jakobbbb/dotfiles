#!/bin/sh

# Show the current xbacklight brightness in a notification.
TIMEOUT=600
ID=2527269
BRIGHTNESS=$(echo "$(light)/1" | bc)
PRIO="low"
([ "$BRIGHTNESS" -eq "0" ] || [ "$BRIGHTNESS" -eq "100" ]) && PRIO="normal"
MESSAGE="Backlight: $BRIGHTNESS%"

dunstify -t $TIMEOUT -r $ID -u $PRIO "$MESSAGE"
