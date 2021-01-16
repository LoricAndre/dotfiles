build_conky: DIR = $(DOTFILES)/conky
build_conky: FILE = conky.conf
build_conky: parse_conky
	@sed -ie 's/#\([0-9a-f]\{6\}\)/\1/' $(DOTFILES)/conky/parsed/conky.conf

build_conky_gcal: DIR = $(DOTFILES)/conky
build_conky_gcal: FILE = gcal.conf
build_conky_gcal: parse_conky_gcal
	@sed -ie 's/#\([0-9a-f]\{6\}\)/\1/' $(DOTFILES)/conky/parsed/gcal.conf

build_conky_bspwm: DIR = $(DOTFILES)/conky
build_conky_bspwm: FILE = bspwm.conf
build_conky_bspwm: parse_conky_bspwm
	@sed -ie 's/#\([0-9a-f]\{6\}\)/\1/' $(DOTFILES)/conky/parsed/bspwm.conf

build_conky_pscircle: DIR = $(DOTFILES)/conky
build_conky_pscircle: FILE = pscircle.conf
build_conky_pscircle: parse_conky_pscircle
	@sed -ie 's/#\([0-9a-f]\{6\}\)/\1/' $(DOTFILES)/conky/parsed/pscircle.conf

link_conky: build_conky build_conky_gcal build_conky_bspwm build_conky_pscircle
	ln $(LN_FLAGS) $(DOTFILES)/conky/parsed/conky.conf $(HOME)/.config/conky/conky.conf
	ln $(LN_FLAGS) $(DOTFILES)/conky/parsed/gcal.conf $(HOME)/.config/conky/gcal.conf
	ln $(LN_FLAGS) $(DOTFILES)/conky/parsed/bspwm.conf $(HOME)/.config/conky/bspwm.conf
	ln $(LN_FLAGS) $(DOTFILES)/conky/parsed/pscircle.conf $(HOME)/.config/conky/pscircle.conf
