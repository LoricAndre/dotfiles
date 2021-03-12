build_i3status-rust: DIR = $(DOTFILES)/i3status-rust
build_i3status-rust: FILE = theme.toml
build_i3status-rust: parse_i3status-rust

link_i3status-rust: build_i3status-rust mkdir_$(HOME)/.config/i3status-rust
	@ln $(LN_FLAGS) $(DOTFILES)/i3status-rust/config.toml $(HOME)/.config/i3status-rust
	ln $(LN_FLAGS) $(DOTFILES)/i3status-rust/parsed/theme.toml $(HOME)/.config/i3status-rust/themes
