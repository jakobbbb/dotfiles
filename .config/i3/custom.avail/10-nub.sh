#!/bin/bash

# Disable the touchpad

device=`xinput | grep "Synaptics" | sed -e "s/.*id=\([0-9]*\).*/\1/"`

xinput --disable $device
