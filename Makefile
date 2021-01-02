.ONESHELL:
DOTFILES = $(HOME)/dotfiles
_INCL = nvim zsh bin desktop kitty i3status-rust \
	ranger misc sway mako fontconfig

ifndef LN_FLAGS
  LN_FLAGS = -sf
endif

PARTS = $(patsubst %, %/Makefile, $(_INCL))
LINKS = $(patsubst %, link_%, $(_INCL))

AUR_HELPER = paru

.DEFAULT_GOAL = dotfiles

ifndef VAR_FILE
  VAR_FILE = $(DOTFILES)/deps/vars.sh
endif

parse_%:
	@set -a
	@. $(VAR_FILE)
	@set +a
	@perl -p -e 's/%\{\{(\w+)\}\}/(exists $$ENV{$$1}?$$ENV{$$1}:"missing variable $$1")/eg' \
	  < $(DIR)/$(FILE) > $(DIR)/parsed/$(FILE)
	@echo "$@ done"


include $(PARTS)

dotfiles: $(LINKS)


install:
	$(AUR_HELPER) -Syu `cat deps/pkgs`
