build_template: DIR = $(DOTFILES)/template
build_template: FILE = colors
build_template: parse_template


template: build_template
	@[ -d $(HOME)/.config/template] && mkdir -p $(HOME)/.config/template
	@ln $(LN_FLAGS) $(DOTFILES)/template/config $(HOME)/.config/template
