#!/usr/bin/env bash

json=$(curl "https://raw.githubusercontent.com/Gogh-Co/Gogh/master/data/themes.json")

target_theme=$1
picker="sk --cmd-query=$target_theme"

theme=$(echo $json | jq -r '.[].name' | $picker)
# echo $theme

json_theme=$(echo $json | jq ".[] | select(.name==\"$theme\")")

# echo $json_theme

color0=$(echo $json_theme | jq -r '.background' | tr -d '#')
color8=$(echo $json_theme | jq -r '.color_09' | tr -d '#')
color1=$(echo $json_theme | jq -r '.color_02' | tr -d '#')
color9=$(echo $json_theme | jq -r '.color_10' | tr -d '#')
color2=$(echo $json_theme | jq -r '.color_03' | tr -d '#')
color10=$(echo $json_theme | jq -r '.color_01' | tr -d '#')
color3=$(echo $json_theme | jq -r '.color_04' | tr -d '#')
color11=$(echo $json_theme | jq -r '.color_12' | tr -d '#')
color4=$(echo $json_theme | jq -r '.color_05' | tr -d '#')
color12=$(echo $json_theme | jq -r '.color_13' | tr -d '#')
color5=$(echo $json_theme | jq -r '.color_06' | tr -d '#')
color13=$(echo $json_theme | jq -r '.color_14' | tr -d '#')
color6=$(echo $json_theme | jq -r '.color_07' | tr -d '#')
color14=$(echo $json_theme | jq -r '.color_15' | tr -d '#')
color7=$(echo $json_theme | jq -r '.foreground' | tr -d '#')
color15=$(echo $json_theme | jq -r '.color_16' | tr -d '#')

cat - << EOF
colors:
  "$target_theme":
    # Black
    "0": "$color0" # base #$color0
    "8": "$color8" # mantle #$color8
    # Red
    "1": "$color1" # red #$color1
    "9": "$color9" # peach #$color9
    # Green
    "2": "$color2" # green #$color2
    "10": "$color10" # surface0 #$color10
    # Yellow
    "3": "$color3" # yellow #$color3
    "11": "$color11" # rosewater #$color11
    # Blue
    "4": "$color4" # blue #$color4
    "12": "$color12" # surface2 #$color12
    # Magenta
    "5": "$color5" # lavender #$color5
    "13": "$color13" # mauve #$color13
    # Cyan
    "6": "$color6" # teal #$color6
    "14": "$color14" # surface1 #$color14
    # White
    "7": "$color7" # text #$color7
    "15": "$color15" # flamingo #$color15
EOF
