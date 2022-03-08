build_polybar: DIR = $(DOTFILES)/polybar
build_polybar: FILE = polybar.conf
build_polybar: parse_polybar


polybar: build_polybar
	@[ -d $(HOME)/.config/polybar ] || mkdir -p $(HOME)/.config/polybar
	@ln $(LN_FLAGS) $(DOTFILES)/polybar/parsed/polybar.conf $(HOME)/.config/polybar/config
