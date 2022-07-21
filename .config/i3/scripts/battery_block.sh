#!/usr/bin/env bash

set -e

PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep \
    percentage | cut -d ":" -f2 | sed 's/ //g')

FULL=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1)

echo ${PERCENTAGE}
if [ $button ]; then
    ~/.local/bin/notify --title 'Battery info' --body "${FULL}" --timeout 2500
fi
