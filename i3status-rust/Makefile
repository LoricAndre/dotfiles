build_i3status-rust: VAR_FILE = ~/.cache/wal/colors.sh
build_i3status-rust: DIR = $(DOTFILES)/i3status-rust
build_i3status-rust: FILE = lule.toml
build_i3status-rust: parse

link_i3status-rust: build_i3status-rust
	ln $(LN_FLAGS) $(DOTFILES)/i3status-rust/config.toml $(HOME)/.config/i3status-rust
	ln $(LN_FLAGS) $(DOTFILES)/i3status-rust/parsed/lule.toml $(HOME)/.config/i3status-rust/themes
