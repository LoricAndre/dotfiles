build_kitty: DIR = $(DOTFILES)/kitty
build_kitty: FILE = colors
build_kitty: parse_kitty

kitty: build_kitty
	@mkdir $(HOME)/.config/kitty
	@ln $(LN_FLAGS) $(DOTFILES)/kitty/conf $(HOME)/.config/kitty/kitty.conf
	@ln $(LN_FLAGS) $(DOTFILES)/kitty/parsed/colors $(HOME)/.config/kitty/kitty.colors
