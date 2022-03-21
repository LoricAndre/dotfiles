#!/bin/bash


# zscroll \
#     -l 20 \
#     -d 0.5 \
#     -u true \
#     -n true \
#     -M "playerctl status" \
#     -m "Playing" '-b " "' \
#     -m "Paused" '-b " "' \
#     -p " | " \
#     "playerctl metadata --format '{{ title }} - {{ artist }}'"

scroll() {
  prefix_cmd="$1"
  cmd="$2"
  max_len="$3"
  i=0
  while true; do
    data=$(eval "$cmd")
    len=${#data}
    if [ $((i+max_len)) -gt $len ]; then
      data="$data | $data"
    fi

    prefix=$(eval "$prefix_cmd")
    if [[ $prefix == " " ]]; then
      i=0
    fi
    echo "$prefix${data:i:max_len}"
    i=$(((i+1)%len))
    sleep 0.5
  done
}

prefix() {
  status=$(playerctl status 2> /dev/null)
  if [[ $status = "Playing" ]]; then
    echo " "
  elif [[ $status = "Paused" ]]; then
    echo " "
  else
    echo ""
  fi
}

scroll "prefix" "playerctl metadata --format '{{ title }} - {{ artist }}'" 20
