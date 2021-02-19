build_mako: DIR = $(DOTFILES)/mako
build_mako: FILE = config
build_mako: parse_mako

link_mako: build_mako mkdir_$(HOME)/.config/mako
	@ln $(LN_FLAGS) $(DOTFILES)/mako/parsed/config $(HOME)/.config/mako
