#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Launch polybar for all "desktops"
for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [ "$m" = "eDP1" ]; then
        MONITOR=$m polybar --reload main & disown
    else
        MONITOR=$m polybar --reload secondary & disown
    fi
done
