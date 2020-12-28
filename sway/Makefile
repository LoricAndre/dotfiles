build_sway: VAR_FILE = $(HOME)/.cache/wal/colors.sh
build_sway: DIR = $(DOTFILES)/sway
build_sway: FILE = config
build_sway: parse

link_sway: build_sway
	ln $(LN_FLAGS) $(DOTFILES)/sway/parsed/config $(HOME)/.config/sway/
