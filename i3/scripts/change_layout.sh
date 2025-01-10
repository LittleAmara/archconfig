#!/usr/bin/env bash

current_layout="$(setxkbmap -query | grep layout | awk -F ' ' '{print $2}')"

if [ "$current_layout" = 'fr' ]; then
    setxkbmap us -option 'terminate:ctrl_alt_bksp,compose:102' && dunstify 'US' -t 1000
else
    setxkbmap fr -option '' && dunstify 'FR' -t 1000
fi
