#!/usr/bin/env bash

# Macos
if [ "$(uname)" == "Darwin" ]; then
    pmset -g batt | tail -1 | awk '{print $3}' | tr -d ';' | tr -d '%'
fi

# Linux
if [ "$(uname)" == "Linux" ]; then
    upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | tr -d '%'
fi
