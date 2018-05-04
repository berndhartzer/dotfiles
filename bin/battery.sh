#!/usr/bin/env bash

# Macos
pmset -g batt | tail -1 | awk '{print $3}' | tr -d ';' | tr -d '%'
