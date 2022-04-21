build_xresources: DIR = $(DOTFILES)/xresources
build_xresources: FILE = xresources
build_xresources: parse_xresources


xresources: build_xresources
	@ln $(LN_FLAGS) $(DOTFILES)/xresources/parsed/xresources $(HOME)/.Xresources
	@xrdb -merge $(HOME)/.Xresources
