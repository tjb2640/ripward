#!/bin/sh

DEVICE_ID="$(sh devid.sh)"

printf "Entering shell on $(adb -s "$DEVICE_ID" shell getprop ro.product.model) ($DEVICE_ID)\\n"
adb -s "$DEVICE_ID" shell
