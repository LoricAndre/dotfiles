return {
    "Isrothy/neominimap.nvim",
    lazy = false, -- NOTE: NO NEED to Lazy load
    cmd = "Neominimap",
    keys = {
        { "<leader>nt",  "<cmd>Neominimap toggle<cr>",      desc = "[minimap] toggle" },
        { "<leader>no",  "<cmd>Neominimap on<cr>",          desc = "[minimap] enable" },
        { "<leader>nc",  "<cmd>Neominimap off<cr>",         desc = "[minimap] disable" },
        { "<leader>nf",  "<cmd>Neominimap focus<cr>",       desc = "[minimap] focus" },
        { "<leader>nu",  "<cmd>Neominimap unfocus<cr>",     desc = "[minimap] unfocus" },
        { "<leader>ns",  "<cmd>Neominimap toggleFocus<cr>", desc = "[minimap] toggle focus" },
        { "<leader>nwt", "<cmd>Neominimap winToggle<cr>",   desc = "[minimap] toggle for current window" },
        { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>",  desc = "[minimap] refresh for current window" },
        { "<leader>nwo", "<cmd>Neominimap winOn<cr>",       desc = "[minimap] enable for current window" },
        { "<leader>nwc", "<cmd>Neominimap winOff<cr>",      desc = "[minimap] disable for current window" },
        { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>",   desc = "[minimap] toggle for current buffer" },
        { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>",  desc = "[minimap] refresh for current buffer" },
        { "<leader>nbo", "<cmd>Neominimap bufOn<cr>",       desc = "[minimap] enable for current buffer" },
        { "<leader>nbc", "<cmd>Neominimap bufOff<cr>",      desc = "[minimap] disable for current buffer" },
    },
    init = function()
        vim.opt.wrap = false       -- Recommended
        vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
        vim.g.neominimap = {
            auto_enable = false,
        }
    end,
}
