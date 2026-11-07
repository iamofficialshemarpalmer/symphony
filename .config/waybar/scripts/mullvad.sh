#!/bin/bash
# Get the status from Mullvad
STATUS=$(mullvad status)

if [[ $STATUS == *"Connected"* ]]; then
    # If a command was passed to toggle, disconnect
    if [[ "$1" == "toggle" ]]; then
        mullvad disconnect
    else
        # Output JSON for Waybar
        IP=$(echo "$STATUS" | grep -oE "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+")
        echo "{\"text\": \"🔒 $IP\", \"class\": \"connected\", \"tooltip\": \"$STATUS\"}"
    fi
else
    if [[ "$1" == "toggle" ]]; then
        mullvad connect
    else
        echo "{\"text\": \"🔓 Disconnected\", \"class\": \"disconnected\"}"
    fi
fi
