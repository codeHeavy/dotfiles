#!/usr/bin/env bash

MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')

if [ -z "$MONITOR" ] || [ "$MONITOR" = "null" ]; then
    echo "Error: Could not determine focused monitor."
    exit 1
fi

DIR="$HOME/Pictures"
mkdir -p "$DIR"

FILE="$DIR/screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"

grim -o "$MONITOR" - | swappy -f -
#grim -o "$MONITOR" "$FILE"
wl-copy < "$FILE"

echo "Saved screenshot & copied to clipboard: $FILE"

