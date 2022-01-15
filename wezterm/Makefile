build_wezterm: DIR = $(DOTFILES)/wezterm
build_wezterm: FILE = wezterm.lua
build_wezterm: parse_wezterm


wezterm: build_wezterm
	@[ -d $(HOME)/.config/wezterm ] || mkdir -p $(HOME)/.config/wezterm
	@ln $(LN_FLAGS) $(DOTFILES)/wezterm/parsed/wezterm.lua $(HOME)/.config/wezterm
