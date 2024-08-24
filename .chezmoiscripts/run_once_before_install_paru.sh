#!/bin/sh

sudo pacman -Sy --needed --noconfirm just
cd "$CHEZMOI_COMMAND_DIR"
just sync-packages
