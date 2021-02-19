build_polybar: DIR = $(DOTFILES)/polybar
build_polybar: FILE = config
build_polybar: parse_polybar

link_polybar: build_polybar mkdir_$(HOME)/.config/polybar
	@ln $(LN_FLAGS) $(DOTFILES)/polybar/parsed/config $(HOME)/.config/polybar/config
