#!/bin/bash

# Download all the APKs that can be downloaded

DEVICE_ID="$(sh devid.sh)"
HERE="$(pwd)"
OUT="$HERE/dump_$DEVICE_ID/apks"


dumpit() {
    mkdir -p "$OUT/$1"
    cd "$OUT/$1"
    echo "Pull $1"
    for path in $(adb shell pm path $1 | sed 's/package://g'); do
        adb -s "$DEVICE_ID" pull "$path"
    done
}

export -f dumpit

for line in $(adb -s "$DEVICE_ID" shell pm list packages | tr -d '\r' | sed 's/package://g'); do
    dumpit $line
done

cd "$OUT" && find . -mindepth 1 -maxdepth 1 -type d | xargs rmdir 2>/dev/null

echo "Done"
