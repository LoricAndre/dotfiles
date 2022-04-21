nvim:
	@[ -d "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim ] || git clone --depth=1 https://github.com/savq/paq-nvim.git \
	    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
	@[ -d $(HOME)/.config/nvim ] || mkdir -p $(HOME)/.config/nvim
	@[ luarocks which lyaml ] || luarocks --lua-version=5.1 --server=http://rocks.moonscript.org install lyaml
	@ln $(LN_FLAGS) $(DOTFILES)/nvim/* $(HOME)/.config/nvim
