#!/usr/bin/env bash

echo "Making theme darker..."

function make_darker() {
    SUBS=(
      "s/#404552/#332e41/gi"
      "s/#d3dae3/#e0d9e7/gi"
      "s/#383c4a/#2c2738/gi"
      "s/#d3dae3/#dcd9e7/gi"
      "s/#4b5162/#403953/gi"
      "s/#3e4350/#302c3e/gi"
      "s/#7c818c/#787388/gi"
      "s/#404552/#352e41/gi"
      "s/#353945/#272433/gi"
      "s/#5294e2/#6841e6/gi"
      "s/#383c4a/#2d2738/gi"
      "s/#444a58/#3c3649/gi"
      "s/#505666/#4c4157/gi"
    )

    for s in ${SUBS[@]}; do
        find . -type f -exec sed -i "$s" {} \;
    done
}
