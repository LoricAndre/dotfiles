#!/usr/bin/bash

layout=$(swaymsg -t get_tree | jq '.orientation' | cut -d'"' -f2)
p='.*(new|close).*'

sw() {
  [[ $1 = vertical ]] && echo horizontal || echo vertical
}

while true; do
  e=$(swaymsg -t subscribe "['window']" | jq '.change')
  [[ $e =~ $p ]] &&
    swaymsg split $layout &&
    layout=$(sw $layout)
  done
