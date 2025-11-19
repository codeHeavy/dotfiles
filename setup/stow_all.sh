#!/usr/bin/env bash

# This script stows all the application configuration directories in this repository.
# It is intended to be run from the root of the dotfiles repository.

set -e

# Directories to ignore. Add any other directories you don't want to stow.
IGNORE_DIRS=(".git" "setup")

echo "Stowing all application configuration directories..."

for dir in */; do
    # Remove trailing slash for cleaner output and comparison
    dir_name="${dir%/}"

    # Check if the directory is in the ignore list
    should_ignore=false
    for ignore in "${IGNORE_DIRS[@]}"; do
        if [[ "$dir_name" == "$ignore" ]]; then
            should_ignore=true
            break
        fi
    done

    # If the directory is not in the ignore list, stow it
    if [ "$should_ignore" = false ]; then
        echo "Stowing $dir_name..."
        stow "$dir_name"
    else
        echo "Ignoring $dir_name."
    fi
done

echo "Stow process complete."
