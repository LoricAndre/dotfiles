DOTFILES=$(HOME)/new_dotfiles
_INCL = nvim zsh bin desktop kitty i3status-rust \
	ranger misc sway mako
ifndef LN_FLAGS
  LN_FLAGS=-sf
endif
PARTS = $(patsubst %, %/Makefile, $(_INCL))
BUILDS = $(patsubst %, build_%, $(_INCL))
LINKS = $(patsubst %, link_%, $(_INCL))

include $(PARTS)

dotfiles: $(BUILDS) $(LINKS)
