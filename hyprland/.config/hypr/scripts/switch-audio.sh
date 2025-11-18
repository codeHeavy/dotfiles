#!/usr/bin/env bash

echo "=== PIPEWIRE SINKS ==="
wpctl status | awk '/Sinks:/,/Sources:/'
echo "======================"

# Extract ID:name
mapfile -t sinks < <(wpctl status \
    | awk '/Sinks:/,/Sources:/' \
    | grep -E '[0-9]+\.' \
    | sed -E 's/^[^0-9]*([0-9]+)\.\s*(.*)\[vol:.*/\1:\2/' \
    | sed 's/[[:space:]]*$//')

echo "=== EXTRACTED ID:NAME PAIRS ==="
printf '%s\n' "${sinks[@]}"
echo "================================"

# Build names array and mapping
names=()
declare -A id_map
for s in "${sinks[@]}"; do
    id="${s%%:*}"
    name="${s#*:}"
    name="$(echo -e "${name}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    names+=("$name")
    id_map["$name"]="$id"
done

echo "=== NAMES ARRAY ==="
printf '%s\n' "${names[@]}"
echo "=================="

# Show rofi menu
selected=$(printf '%s\n' "${names[@]}" | rofi -dmenu -i -p "Audio Output")
echo "=== SELECTED ==="
echo "$selected"
echo "================"

# Trim selection
selected="$(echo -e "$selected" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

# Lookup ID
id="${id_map[$selected]}"
echo "=== MAPPED ID ==="
echo "$id"
echo "================"

wpctl set-default "$id"

