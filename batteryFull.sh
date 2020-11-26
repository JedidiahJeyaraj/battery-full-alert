#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    if on_ac_power; then
        if [ "$battery_percent" -gt 95 ]; then
           notify-send -u critical "Please unplug your AC adapter" "Battery level: ${battery_percent}% (charged above 95%)" -i battery-full-charged; play /usr/share/sounds/gnome/default/alerts/drip.ogg
        fi
    fi
    sleep 300 # (5 minutes)
done
