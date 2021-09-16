#!/usr/bin/env bash

echo "Making theme darker..."

function make_darker() {
    SUBS=(
      "s/#404552/#1e192c/gi"
      "s/#d3dae3/#e0d9e7/gi"
      "s/#383c4a/#261e37/gi"
      "s/#d3dae3/#dcd9e7/gi"
      "s/#4b5162/#2e283f/gi"
      "s/#3e4350/#262233/gi"
      "s/#7c818c/#787388/gi"
      "s/#404552/#282233/gi"
      "s/#353945/#1e1b29/gi"
      "s/#5294e2/#5733cc/gi"
      "s/#383c4a/#221d2c/gi"
      "s/#444a58/#282333/gi"
      "s/#505666/#3a3044/gi"
      "s/#3e4553/#322246/gi"
      "s/#2f343f/#251a34/gi"
    )

    for s in ${SUBS[@]}; do
        find . -type f -exec sed -i "$s" {} \;
    done
}
