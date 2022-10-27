#!/usr/bin/env bash

set -e

FULL=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1)

PERCENTAGE=$(echo "${FULL}" | grep percentage | cut -d ":" -f2 | sed 's/ //g')

STATE=$(echo "${FULL}" |  grep state | cut -d ":" -f2 | sed 's/ //g')

[[ "$STATE" = "charging" ]] && PERCENTAGE+=" ⚡"

echo ${PERCENTAGE}
if [ $button ]; then
    ~/.local/bin/notify --title 'Battery info' --body "${FULL}" --timeout 2500
fi
