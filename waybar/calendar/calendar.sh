#!/bin/bash

# This script provides a clickable calendar module for Waybar.
#
# When run without arguments, it continuously outputs JSON for the Waybar module.
# When run with `--click`, it shows a `yad` calendar popup.

# Ensure only one instance of the popup is running
if [[ "$1" == "--click" ]]; then
    pkill -f "yad --calendar"
    yad --calendar \
        --undecorated \
        --close-on-unfocus \
        --no-buttons \
        --title="Calendar" \
        --width=260 \
        --height=200 \
        --posx=1600 \
        --posy=35 &
    exit 0
fi

# Main loop for Waybar
while true; do
    TOOLTIP_TEXT=$(date "+%A, %d %B %Y")
    JSON_OUTPUT=$(printf '{"text": "%s", "tooltip": "%s"}' "$(date "+%d %b")" "$TOOLTIP_TEXT")
    echo $JSON_OUTPUT
    sleep 1
done
