DOTFILES = $(HOME)/dotfiles
_INCL = nvim zsh bin desktop kitty i3status-rust \
	ranger misc sway mako
ifndef LN_FLAGS
  LN_FLAGS = -sf
endif
PARTS = $(patsubst %, %/Makefile, $(_INCL))
BUILDS = $(patsubst %, build_%, $(_INCL))
LINKS = $(patsubst %, link_%, $(_INCL))

parse:
	@set -a
	@. $(VAR_FILE)
	@set +a
	@perl -p -e 's/%\{\{(\w+)\}\}/(exists $$ENV{$$1}?$$ENV{$$1}:"missing variable $$1")/eg' \
	  < $(DIR)/$(FILE) > $(DIR)/parsed/$(FILE)


include $(PARTS)

dotfiles: $(LINKS)
