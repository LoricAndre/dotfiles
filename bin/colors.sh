#!/bin/bash
DOTFILES=$HOME/dotfiles
ln -sf "$DOTFILES/deps/base16/colors/$(ls $DOTFILES/deps/base16/colors | fzf)" "$DOTFILES/deps/vars.sh"
