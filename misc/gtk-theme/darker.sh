#!/usr/bin/env bash

echo "Making theme darker..."

function make_darker() {
    SUBS=(
      "s/#404552/#2e3341/gi"
      "s/#d3dae3/#d9dfe7/gi"
      "s/#383c4a/#272a38/gi"
      "s/#d3dae3/#d9dfe7/gi"
      "s/#4b5162/#393f53/gi"
      "s/#3e4350/#2c313e/gi"
      "s/#7c818c/#737a88/gi"
      "s/#404552/#2e3341/gi"
      "s/#353945/#242833/gi"
      "s/#5294e2/#4192e6/gi"
      "s/#383c4a/#272a38/gi"
      "s/#444a58/#363b49/gi"
      "s/#505666/#414757/gi"
    )

    for s in ${SUBS[@]}; do
        find . -type f -exec sed -i "$s" {} \;
    done
}
