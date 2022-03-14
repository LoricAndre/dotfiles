#!/usr/bin/env zsh

if [ -z $1 ]; then
	echo "Usage: $0 <name of hidden scratchpad window>"
	exit 1
fi
    
xdotool search --class ${1} | while read pid; do
	echo "Toggle $pid"
	bspc node "$pid" --flag hidden -f
done
