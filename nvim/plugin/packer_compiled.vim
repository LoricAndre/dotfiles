" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/loric/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/loric/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/loric/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/loric/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/loric/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  colorizer = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/colorizer"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["completion-treesitter"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/completion-treesitter"
  },
  ["disco.vim"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/disco.vim"
  },
  ["echodoc.vim"] = {
    config = { "\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1ÿÿ=\1\2\0K\0\1\0\30echodoc#enable_at_startup\6g\bvim\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["eskk.vim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\teskk\20plugins.classes\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/eskk.vim"
  },
  firenvim = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["fzterm.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vfzterm\17plugins.misc\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/fzterm.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tsaga\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lule.nvim"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/lule.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\ncompe\23plugins.completion\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bdap\17plugins.misc\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-jdtls"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\njdtls\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\blsp\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0056\0\0\0'\2\1\0B\0\2\2B\0\1\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/loric/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["pear-tree"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rpearTree\17plugins.misc\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/pear-tree"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/seoul256.vim"
  },
  ultisnips = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14ultisnips\17plugins.misc\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-arduino"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-arduino"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-doge"] = {
    config = { "\27LJ\2\n8\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14<Leader>g\17doge_mapping\6g\bvim\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-notes"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nnotes\20plugins.classes\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-notes"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nvsnip\17plugins.misc\frequire\0" },
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["wal.vim"] = {
    loaded = true,
    path = "/home/loric/.local/share/nvim/site/pack/packer/start/wal.vim"
  }
}

-- Config for: fzterm.nvim
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vfzterm\17plugins.misc\frequire\0", "config", "fzterm.nvim")
-- Config for: vim-vsnip
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nvsnip\17plugins.misc\frequire\0", "config", "vim-vsnip")
-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\blsp\16plugins.lsp\frequire\0", "config", "nvim-lspconfig")
-- Config for: eskk.vim
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\teskk\20plugins.classes\frequire\0", "config", "eskk.vim")
-- Config for: nvim-jdtls
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\njdtls\16plugins.lsp\frequire\0", "config", "nvim-jdtls")
-- Config for: ultisnips
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14ultisnips\17plugins.misc\frequire\0", "config", "ultisnips")
-- Config for: lspsaga.nvim
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tsaga\16plugins.lsp\frequire\0", "config", "lspsaga.nvim")
-- Config for: nvim-compe
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\ncompe\23plugins.completion\frequire\0", "config", "nvim-compe")
-- Config for: echodoc.vim
try_loadstring("\27LJ\2\n;\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1ÿÿ=\1\2\0K\0\1\0\30echodoc#enable_at_startup\6g\bvim\0", "config", "echodoc.vim")
-- Config for: nvim-dap-virtual-text
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bdap\17plugins.misc\frequire\0", "config", "nvim-dap-virtual-text")
-- Config for: vim-doge
try_loadstring("\27LJ\2\n8\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14<Leader>g\17doge_mapping\6g\bvim\0", "config", "vim-doge")
-- Config for: vim-notes
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nnotes\20plugins.classes\frequire\0", "config", "vim-notes")
-- Config for: pear-tree
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rpearTree\17plugins.misc\frequire\0", "config", "pear-tree")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0056\0\0\0'\2\1\0B\0\2\2B\0\1\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
