build_template: DIR = $(DOTFILES)/template
build_template: FILE = colors
build_template: parse_template


template: build_template
	@mkdir $(HOME)/.config/template
	@ln $(LN_FLAGS) $(DOTFILES)/template/config $(HOME)/.config/template
