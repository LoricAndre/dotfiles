return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "vn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm"
      },
    },
    indent = {
      enable = true
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = { query = "@function.outer", desc = "[TS] Outer function" },
          ["if"] = { query = "@function.inner", desc = "[TS] Inner function" },
          ["ac"] = { query = "@class.outer", desc = "[TS] Outer class" },
          ["ic"] = { query = "@class.inner", desc = "[TS] Inner class" },
          ["ab"] = { query = "@block.outer", desc = "[TS] Outer block" },
          ["ib"] = { query = "@block.inner", desc = "[TS] Inner block" },
          ["aa"] = { query = "@parameters.outer", desc = "[TS] Outer parameters" },
          ["ia"] = { query = "@parameters.inner", desc = "[TS] Inner parameters" },
          ["as"] = { query = "@scope.outer", query_group = "locals", desc = "[TS] Outer scope" },
          ["is"] = { query = "@scope.inner", query_group = "locals", desc = "[TS] Inner scope" },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["gwf"] = { query = "@function.inner", desc = "[TS] Swap next function" },
          ["gwc"] = { query = "@class.inner", desc = "[TS] Swap next class" },
          ["gwb"] = { query = "@block.inner", desc = "[TS] Swap next block" },
          ["gwa"] = { query = "@parameter.inner", desc = "[TS] Swap next parameter" },
          ["gws"] = { query = "@scope.inner", query_group = "locals", desc = "[TS] Swap next scope" },
        },
        swap_previous = {
          ["gwF"] = { query = "@function.inner", desc = "[TS] Swap previous function" },
          ["gwC"] = { query = "@class.inner", desc = "[TS] Swap previous class" },
          ["gwB"] = { query = "@block.inner", desc = "[TS] Swap previous block" },
          ["gwA"] = { query = "@parameter.inner", desc = "[TS] Swap previous parameter" },
          ["gwS"] = { query = "@scope.inner", query_group = "locals", desc = "[TS] Swap previous scope" },
        }
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [")f"] = { query = "@function.outer", desc = "[TS] Next function" },
          [")c"] = { query = "@class.outer", desc = "[TS] Next class" },
          [")b"] = { query = "@block.outer", desc = "[TS] Next block" },
          [")a"] = { query = "@parameter.outer", desc = "[TS] Next parameter" },
          [")s"] = { query = "@scope.outer", query_group = "locals", desc = "[TS] Next scope" },
        },
        goto_next_end = {
          [")F"] = { query = "@function.outer", desc = "[TS] Next function" },
          [")C"] = { query = "@class.outer", desc = "[TS] Next class" },
          [")B"] = { query = "@block.outer", desc = "[TS] Next block" },
          [")A"] = { query = "@parameter.outer", desc = "[TS] Next parameter" },
          [")S"] = { query = "@scope.outer", query_group = "locals", desc = "[TS] Next scope" },
        },
        goto_previous_start = {
          ["(f"] = { query = "@function.outer", desc = "[TS] Previous function" },
          ["(c"] = { query = "@class.outer", desc = "[TS] Previous class" },
          ["(b"] = { query = "@block.outer", desc = "[TS] Previous block" },
          ["(a"] = { query = "@parameter.outer", desc = "[TS] Previous parameter" },
          ["(s"] = { query = "@scope.outer", query_group = "locals", desc = "[TS] Previous scope" },
        },
        goto_previous_end = {
          ["(F"] = { query = "@function.outer", desc = "[TS] Previous function" },
          ["(C"] = { query = "@class.outer", desc = "[TS] Previous class" },
          ["(B"] = { query = "@block.outer", desc = "[TS] Previous block" },
          ["(A"] = { query = "@parameter.outer", desc = "[TS] Previous parameter" },
          ["(S"] = { query = "@scope.outer", query_group = "locals", desc = "[TS] Previous scope" },
        },
      }
    }
  }
}
