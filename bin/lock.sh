#!/bin/bash

color0=#1E1E1E
color1=#D16969
color2=#608B4E
color3=#D7BA7D
color4=#9CDCFE
color5=#C586C0
color6=#4EC9B0
color7=#ABB2BF
color8=#5C6370
color9=#F44747
color10=#B5CEA8
color11=#DCDCAA
color12=#569CD6
color13=#C586C0
color14=#4EC9B0
color15=#ffffff

lockx() {
  i3lock --clock -i /home/loric/.wallpapers/active.jpg -t --indicator -n \
    --pass-screen-keys --pass-volume-keys \
    --insidevercolor="$color2" --insidecolor=00000000 \
    --insidewrongcolor="$color1" --ringvercolor="$color4" \
    --ringwrongcolor="$color1" --ringcolor="$color6" \
    --line-uses-inside --keyhlcolor="$color4" \
    --timecolor="$color0" --radius=100
}

waylock() {
  swaylock --clock -i /home/loric/.wallpapers/active.jpg \
    --inside-ver-color="$color2" --inside-color=00000000 \
    --inside-wrong-color="$color1" --ring-ver-color="$color4" \
    --ring-wrong-color="$color1" --ring-color="$color6" \
    --line-uses-inside --key-hl-color="$color4" \
    -e 
}


if [[ $1 == wayland ]]; then 
  waylock
else
  lockx
fi
