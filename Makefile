.ONESHELL:
ifndef DOTFILES
  DOTFILES = $(HOME)/dotfiles
endif
_INCL = nvim bin desktop zsh \
	ranger misc fontconfig \
	kitty neofetch

ifndef LN_FLAGS
  LN_FLAGS = -sf
endif

PARTS = $(patsubst %, %/Makefile, $(_INCL))
LINKS = $(patsubst %, link_%, $(_INCL))
ifndef AUR_HELPER
  AUR_HELPER = paru
endif

.DEFAULT_GOAL = dotfiles

ifndef VAR_FILE
  VAR_FILE = $(DOTFILES)/deps/nord.sh
endif

parse_%:
	@set -a
	. $(VAR_FILE)
	set +a
	perl -p -e 's/%\{\{(\w+)\}\}/(exists $$ENV{$$1}?$$ENV{$$1}:"missing variable $$1")/eg' \
	 < $(DIR)/$(FILE) > $(DIR)/parsed/$(FILE)
	echo "$@ done"

mkdir_/%:
	@mkdir -p $*

include $(PARTS)

dotfiles: $(LINKS)


install:
	$(AUR_HELPER) -S `cat deps/pkgs` --needed --noconfirm

add_%:
	@cd $(DOTFILES)
	mkdir -p $*
	mkdir -p $*/parsed
	echo "Enter config file name:"
	read file
	touch $*/$$file
	echo "build_$*: DIR = \$$(DOTFILES)/$*" > $*/Makefile
	echo "build_$*: FILE = $$file" >> $*/Makefile
	echo "build_$*: parse_$*" >> $*/Makefile
	echo "" >> $*/Makefile
	echo "Enter destination dir name relative to \$$HOME:"
	read dir
	echo "Enter destination file name:"
	read dest
	echo "link_$*: build_$* mkdir_\$$(HOME)/$$dir" >> $*/Makefile
	echo "	@ln \$$(LN_FLAGS) \$$(DOTFILES)/$*/$$file \$$(HOME)/$$dir/$$dest" >> $*/Makefile
	git add $*
	echo "Don't forget to add $* to the _INCL variable."
