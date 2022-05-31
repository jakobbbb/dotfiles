#!/usr/bin/env bash

MENSADATE=$(date -Ih -d "+10 hours")
MENSADATE_FILE="/tmp/mensadate"
MENSAMEAL_FILE="/tmp/mensa"
MENSA_ID="151"

[ -e "/tmp/mensadate" ] && grep $MENSADATE $MENSADATE_FILE && exit 0

echo $MENSADATE > $MENSADATE_FILE
curl https://openmensa.org/api/v2/canteens/$MENSA_ID/days/$MENSADATE/meals \
    | jq -r '.[] | select(.category|test("Veg*")) | .name' \
    | sed -z "s/\n\(.\)/, \1/g" \
    > $MENSAMEAL_FILE
