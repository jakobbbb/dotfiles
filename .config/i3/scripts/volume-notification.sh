#!/bin/sh

# Show the current pulse audio volume in a notification.
TIMEOUT=600
ID=1049304
SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
VOLUME=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
[ "$VOLUME" -ge "101" ] && PRIO="critical" || PRIO="low"
MESSAGE="Volume: $VOLUME%"

dunstify -t $TIMEOUT -r $ID -u $PRIO "$MESSAGE"
