#!/bin/sh

adb devices | grep -oP '\b[a-fA-Z0-9]{10,}\b'
