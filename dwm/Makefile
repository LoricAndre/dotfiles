link_dwm:
	ln $(LN_FLAGS) $(DOTFILES)/dwm/config.h $(DOTFILES)/bin/src/dwm/
	ln $(LN_FLAGS) $(DOTFILES)/dwm/patches.h $(DOTFILES)/bin/src/dwm
	ln $(LN_FLAGS) $(DOTFILES)/bin/src/dwm/dwm-msg $(DOTFILES)/bin
	cd $(DOTFILES)/bin/src/dwm && sudo make clean install
