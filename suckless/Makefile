build_st: DIR = $(DOTFILES)/suckless
build_st: FILE = st.h
build_st: parse_st

link_st: build_st
	ln $(LN_FLAGS) $(DOTFILES)/suckless/parsed/st.h $(DOTFILES)/bin/src/st/config.h
	cd $(DOTFILES)/bin/src/st && sudo make clean install

link_suckless: link_st
