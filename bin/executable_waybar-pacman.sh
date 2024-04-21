#!/usr/bin/env bash

packages=$(pacman -Qeu)
count=$(echo "$packages" | wc -l)

res=`cat <<- EOF
  {
    "text": "$count",
    "tooltip": "$packages"
  }
EOF`
echo $res
