#!/bin/sh

sudo pacman -Sy --needed --noconfirm just
cd "$HOME/.local/share/chezmoi"
just sync-packages
