#!/bin/bash

# execute files in custom.d
for f in $(find -L ~/.config/i3/custom.d -type f -executable -iname "*.sh"); do
    $f
done
