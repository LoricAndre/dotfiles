#!/bin/bash

lock() {
  i3lock-fancy --clock \
    \ # -i /home/loric/wallpapers/active.png \
    --indicator \
    --pass-screen-keys --pass-volume-keys \
    --insidevercolor="%{{color2}}" --insidecolor=00000000 \
    --insidewrongcolor="%{{color1}}" --ringvercolor="%{{color4}}" \
    --ringwrongcolor="%{{color1}}" --ringcolor="%{{color6}}" \
    --line-uses-inside --keyhlcolor="%{{color4}}" \
    --timecolor="%{{color0}}" --veriftext="" \
    --wrongtext="" --radius=100 \
    --veriftext="" --noinputtext="" \
    --locktext=""
}

lock
