#!/bin/sh

DEVICE_ID="$(sh devid.sh)"
HERE="$(pwd)"
OUT="$HERE/dump_$DEVICE_ID"

mkdir -p "$OUT/"

mkdir -p "$OUT/sdcard"
cd "$OUT/sdcard"
adb -s "$DEVICE_ID" pull "/sdcard/DCIM"
adb -s "$DEVICE_ID" pull "/sdcard/Documents"
adb -s "$DEVICE_ID" pull "/sdcard/Download"
adb -s "$DEVICE_ID" pull "/sdcard/Pictures"
