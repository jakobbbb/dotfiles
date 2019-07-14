#!/bin/bash

# disable capslock
setxkbmap -option caps:none

# execute files in custom.d
for f in ~/.config/i3/custom.d/*
do
    sh $f
done
