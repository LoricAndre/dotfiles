#!/bin/bash

pgrep polybar && pkill polybar 
while [ ! -z $(pgrep polybar) ]; do
  sleep 0.1
done

polybar top
