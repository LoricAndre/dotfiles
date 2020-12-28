build_kitty: VAR_FILE = $(HOME)/.cache/wal/colors.sh
build_kitty: DIR = $(DOTFILES)/kitty
build_kitty: FILE = colors
build_kitty: parse

link_kitty: build_kitty
	ln $(LN_FLAGS) $(DOTFILES)/kitty/conf $(HOME)/.config/kitty/kitty.conf
	ln $(LN_FLAGS) $(DOTFILES)/kitty/parsed/colors $(HOME)/.config/kitty/kitty.colors
