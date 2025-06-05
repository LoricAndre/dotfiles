vim.g.mapleader = ' '

vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_fzf = 1
vim.g.loaded_skim = 1

require('env')

-- -- Bootstrap lazy.nvim
-- local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- ---@diagnostic disable-next-line: undefined-field
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
--   local out = vim.fn.system({
--     'git',
--     'clone',
--     '--filter=blob:none',
--     '--branch=stable',
--     lazyrepo,
--     lazypath,
--   })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
--       { out,                            'WarningMsg' },
--       { '\nPress any key to exit...' },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- -- Setup lazy.nvim
-- require('lazy').setup({
--   spec = {
--     { import = 'plugins' },
--     { import = 'plugins.colorschemes' },
--     { import = 'plugins.langs' },
--   },
--   checker = { enabled = true },
-- })

do
    -- Specifies where to install/use rocks.nvim
    local install_location = vim.fs.joinpath(vim.fn.stdpath("data") --[[@as string]], "rocks")

    -- Set up configuration options related to rocks.nvim (recommended to leave as default)
    local rocks_config = {
        rocks_path = vim.fs.normalize(install_location),
    }

    vim.g.rocks_nvim = rocks_config

    -- Configure the package path (so that plugin code can be found)
    local luarocks_path = {
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
        vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

    -- Configure the C path (so that e.g. tree-sitter parsers can be found)
    local luarocks_cpath = {
        vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
        vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    -- Add rocks.nvim to the runtimepath
    vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))
end

-- If rocks.nvim is not installed then install it!
if not pcall(require, "rocks") then
    local rocks_location = vim.fs.joinpath(vim.fn.stdpath("cache") --[[@as string]], "rocks.nvim")

    if not vim.uv.fs_stat(rocks_location) then
        -- Pull down rocks.nvim
        local url = "https://github.com/nvim-neorocks/rocks.nvim"
        vim.fn.system({ "git", "clone", "--filter=blob:none", url, rocks_location })
        -- Make sure the clone was successfull
        assert(vim.v.shell_error == 0, "rocks.nvim installation failed. Try exiting and re-entering Neovim!")
    end

    -- If the clone was successful then source the bootstrapping script
    vim.cmd.source(vim.fs.joinpath(rocks_location, "bootstrap.lua"))

    vim.fn.delete(rocks_location, "rf")
end
