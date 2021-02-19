build_bspwm: DIR = $(DOTFILES)/bspwm
build_bspwm: FILE = bspwmrc
build_bspwm: parse_bspwm

link_bspwm: build_bspwm mkdir_$(HOME)/.config/bspwm mkdir_$(HOME)/.config/sxhkd
	@ln $(LN_FLAGS) $(DOTFILES)/bspwm/bspwmrc $(HOME)/.config/bspwm/bspwmrc
	ln $(LN_FLAGS) $(DOTFILES)/bspwm/sxhkdrc $(HOME)/.config/sxhkd/sxhkdrc
