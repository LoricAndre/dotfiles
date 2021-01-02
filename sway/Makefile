build_sway: DIR = $(DOTFILES)/sway
build_sway: FILE = config
build_sway: parse_sway

link_sway: build_sway
	ln $(LN_FLAGS) $(DOTFILES)/sway/parsed/config $(HOME)/.config/sway/
