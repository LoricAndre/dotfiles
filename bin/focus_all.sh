#!/usr/bin/env bash
for monitor in $(bspc query --names -M); do `bspc desktop -f ${monitor}_$@`; done

