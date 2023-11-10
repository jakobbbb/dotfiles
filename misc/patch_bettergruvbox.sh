#!/usr/bin/bash


function patch_colors() {
  if [ ! -O "$1" ]; then
    echo "You don't own '$1'.  Try running as root."
    exit 1
  fi
  echo "Patching colors..."
  SUBS=(
    "s/#b8bb26/#ceb53d/gi"
    "s/#282828/#292220/gi"
  )

  for s in ${SUBS[@]}; do
      find $1 -type f -exec sed -i "$s" {} \;
  done
  echo "Done :)"
}

patch_colors /usr/share/themes/BetterGruvbox
