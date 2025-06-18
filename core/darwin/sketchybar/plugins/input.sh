#!/bin/bash

function get_input_source() {
    local source_id=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID | awk -F'.' '{print $NF}')

    case "$source_id" in
        "ABC") echo "US" ;;
        "RussianWin") echo "RU" ;;
        *) echo "$source_id" ;;
    esac
}

current_source=$(get_input_source)
sketchybar --set "$NAME" icon="" label="$current_source"
