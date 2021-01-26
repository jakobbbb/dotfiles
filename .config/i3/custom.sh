#!/bin/bash

# execute files in custom.d
for f in ~/.config/i3/custom.d/*.sh
do
    sh $f
done
