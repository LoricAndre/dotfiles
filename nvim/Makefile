nvim:
	@[ -d $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim ] || git clone --depth 1 https://github.com/wbthomason/packer.nvim $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim
	@[ -d $(HOME)/.config/nvim ] || mkdir -p $(HOME)/.config/nvim
	@ln $(LN_FLAGS) $(DOTFILES)/nvim/* $(HOME)/.config/nvim
