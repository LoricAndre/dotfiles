#!/bin/sh

if hyprctl monitors all | grep 'Monitor' | grep -vq 'eDP-'; then
  echo "External monitor detected, suspending..."
  systemctl suspend
else
  echo "No external monitor detected, enabling deep sleep..."
  systemctl suspend-then-hibernate
fi