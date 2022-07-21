#!/usr/bin/env bash

set -e

PERCENTAGE=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
ONOFF=$(awk -F"[][]" '/Left:/ { print $4 }' <(amixer sget Master))

if [ ${ONOFF} = 'off' ]; then
    echo 'MUTE'
else
    echo ${PERCENTAGE}
fi;
