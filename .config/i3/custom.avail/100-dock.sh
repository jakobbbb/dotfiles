#!/bin/bash

# Crappy ThinkPad docking station script to setup displays according
# to whether or not the computer is docked.

undocked () {
    notify-send "Undocked..."
    sleep 2
    xrandr --output LVDS-1 --auto

}

docked () {
    notify-send "Docked..."
    sleep 2
    xrandr --output LVDS-1 --off
    xrandr --output VGA-1 --auto
    xrandr --output DP-2 --auto
    xrandr --output VGA-1 --left-of DP-2
    sleep 2
    # Maybe assign workspaces to displays?
}

# Eclipse's Refactor->Rename shortcut is identical with i3's restart
# shortcut, which is less than ideal.  So let's at least not do the
# docking station shenanigans while in Eclipse.
xprop -id $(xdotool getactivewindow) | grep -q "\- Eclipse"
if [ $? -eq 1 ]; then
    lsblk --scsi | grep UJ8C2 && docked || undocked
else
    notify-send "Today's Pro Tip: Use Alt+Shift+T to refactor without\
 restarting your window manager!"
fi

redshift -O 5400

