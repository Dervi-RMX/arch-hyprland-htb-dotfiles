#!/usr/bin/env bash
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
status=$(playerctl -p spotify status 2>/dev/null)
if [ "$status" = "Playing" ]; then
    title=$(playerctl -p spotify metadata title 2>/dev/null | cut -c1-13)
    echo " ${title} 󰏤"
elif [ "$status" = "Paused" ]; then
    title=$(playerctl -p spotify metadata title 2>/dev/null | cut -c1-13)
    echo " ${title} 󰐊"
else
    echo ""
fi
