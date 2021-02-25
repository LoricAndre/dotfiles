#!/usr/bin/env zsh

bspc node `xdotool search --class dropdown | head -n1` --flag hidden -f
