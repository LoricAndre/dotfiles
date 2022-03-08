build_sxhkd: DIR = $(DOTFILES)/sxhkd
build_sxhkd: FILE = colors
build_sxhkd: parse_sxhkd


sxhkd: build_sxhkd
	@[ -d $(HOME)/.config/sxhkd ] || mkdir -p $(HOME)/.config/sxhkd
	@ln $(LN_FLAGS) $(DOTFILES)/sxhkd/sxhkdrc $(HOME)/.config/sxhkd
