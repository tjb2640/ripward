#!/bin/bash

# e.g.
# ./telegrab.sh org.telegram.messenger

DEVICE_ID="$(sh devid.sh)"
HERE="$(pwd)"
OUT="$HERE/dump_$DEVICE_ID/appdata"

mkdir -p "$OUT"
cd "$OUT/"
adb -s "$DEVICE_ID" pull "/storage/self/primary/Android/data/$1"
