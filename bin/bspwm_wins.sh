#!/bin/bash

function rec {
  root=$*
  if [[ ! $root == null ]]; then
    name=$(echo $root | jq '.client.className')
    if [[ ! $name == null ]]; then
      case $name in
        \"Firefox\")
          printf " "
          ;;
        \"kitty\")
          printf " "
          ;;
        *)
          printf " "
          ;;
      esac
    fi
    first=$(echo $root | jq '.firstChild')
    second=$(echo $root | jq '.secondChild')
    time rec $first &
    time rec $second &

  fi

}

function icon {
  case $1 in
    \"firefox\")
      printf " "
      ;;
    \"kitty\"|\"xst-256color\")
      printf " "
      ;;
    \"st\")
      printf " "
      ;;
    \"mpv\")
      printf " "
      ;;
    \"discord\")
      printf "ﭮ "
      ;;
    \"zoom\")
      printf " "
      ;;
    \"Opera\")
      printf " "
      ;;
    \"KeePass2\")
      printf " "
      ;;
    \"Slack\")
      printf " "
      ;;
    \"scratchterm\")
      ;;
    *)
      printf ""
      # printf " "
      ;;
  esac
}
bspc subscribe node_add node_remove node_transfer node_swap | while read l; do
for desktop in $(bspc query -D); do
  root=$(bspc query -T -d "$desktop" | jq '.root')
  # icons=$(time rec $root)
  if [[ ! $root == null ]]; then
    classes=$(jq -n --unbuffered "$root" | jq --unbuffered '.. | .className? // empty')
    icons=
    for class in $classes; do
      icons=$icons$(icon $class)
    done
    prefix=$(bspc query -D -d "$desktop" --names | cut -d' ' -f1)
    if [ -z $1 ]; then
      bspc desktop "$desktop" -n "$prefix $icons" 
    else echo "debugging : $prefix $icons"
    fi
  fi
done
done
