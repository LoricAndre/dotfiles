build_river: DIR = $(DOTFILES)/river
build_river: FILE = colors
build_river: parse_river


river: #build_river
	@chmod +x $(DOTFILES)/river/init
	@[ -d $(HOME)/.config/river ] || mkdir -p $(HOME)/.config/river
	@ln $(LN_FLAGS) $(DOTFILES)/river/init $(HOME)/.config/river
