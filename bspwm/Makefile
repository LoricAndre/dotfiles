build_bspwm: DIR = $(DOTFILES)/bspwm
build_bspwm: FILE = bspwmrc
build_bspwm: parse_bspwm


bspwm: build_bspwm
	@[ -d $(HOME)/.config/bspwm ] || mkdir -p $(HOME)/.config/bspwm
	@ln $(LN_FLAGS) $(DOTFILES)/bspwm/bspwmrc $(HOME)/.config/bspwm
