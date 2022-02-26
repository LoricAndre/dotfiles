build_st: DIR = $(DOTFILES)/st
build_st: FILE = config.h
build_st: parse_st


st: build_st
	@ln $(LN_FLAGS) $(DOTFILES)/st/parsed/config.h $(DOTFILES)/st/src/
	@cd $(DOTFILES)/st/src && sudo make clean install
