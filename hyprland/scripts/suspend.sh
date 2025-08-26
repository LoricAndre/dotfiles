#!/bin/sh

if [ -z "$(hyprctl monitors all | grep 'Monitor' | grep -v 'eDP-')" ]; then
  systemctl suspend-then-hibernate
fi