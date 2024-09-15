return {
  "sindrets/diffview.nvim",
  enabled = false,
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },
  opts = {
    diff_binaries = false,    -- Show diffs for binaries
    enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
    git_cmd = { "git" },      -- The git executable followed by default args.
    hg_cmd = { "hg" },        -- The hg executable followed by default args.
    use_icons = true,         -- Requires nvim-web-devicons
    show_help_hints = true,   -- Show hints for how to open the help panel
    watch_index = true,       -- Update views and index buffers when the git index changes.
    icons = {                 -- Only applies when use_icons is true.
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
      done = "✓",
    },
    view = {
      -- Configure the layout and behavior of different types of views.
      -- Available layouts:
      --  'diff1_plain'
      --    |'diff2_horizontal'
      --    |'diff2_vertical'
      --    |'diff3_horizontal'
      --    |'diff3_vertical'
      --    |'diff3_mixed'
      --    |'diff4_mixed'
      -- For more info, see ':h diffview-config-view.x.layout'.
      default = {
        -- Config for changed files, and staged files in diff views.
        layout = "diff2_horizontal",
        winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
      },
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = "diff3_horizontal",
        disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
        winbar_info = true,         -- See ':h diffview-config-view.x.winbar_info'
      },
      file_history = {
        -- Config for changed files in file history views.
        layout = "diff2_horizontal",
        winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
      },
    },
    file_panel = {
      listing_style = "tree",            -- One of 'list' or 'tree'
      tree_options = {                   -- Only applies when listing_style is 'tree'
        flatten_dirs = true,             -- Flatten dirs that only contain one single dir
        folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
      },
      win_config = {                     -- See ':h diffview-config-win_config'
        position = "left",
        width = 35,
        win_opts = {}
      },
    },
    file_history_panel = {
      log_options = { -- See ':h diffview-config-log_options'
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
        hg = {
          single_file = {},
          multi_file = {},
        },
      },
      win_config = { -- See ':h diffview-config-win_config'
        position = "bottom",
        height = 16,
        win_opts = {}
      },
    },
    commit_log_panel = {
      win_config = { -- See ':h diffview-config-win_config'
        win_opts = {},
      }
    },
    default_args = { -- Default args prepended to the arg-list for the listed commands
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
    hooks = {},                -- See ':h diffview-config-hooks'
    keymaps = {
      disable_defaults = true, -- Disable the default keymaps
      view = {
        -- The `view` bindings are active in the diff buffers, only when the current
        -- tabpage is a Diffview.
        { "n", "<tab>",   function() require("diffview.actions").select_next_entry() end,           { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>", function() require("diffview.actions").select_prev_entry() end,           { desc = "Open the diff for the previous file" } },
        { "n", "gf",      function() require("diffview.actions").goto_file_edit() end,              { desc = "Open the file in the previous tabpage" } },
        { "n", "gF",      function() require("diffview.actions").goto_file_split() end,             { desc = "Open the file in a new split" } },
        { "n", "<C-Tab>", function() require("diffview.actions").cycle_layout() end,                { desc = "Cycle through available layouts." } },
        { "n", "(x",      function() require("diffview.actions").prev_conflict() end,               { desc = "In the merge-tool: jump to the previous conflict" } },
        { "n", ")x",      function() require("diffview.actions").next_conflict() end,               { desc = "In the merge-tool: jump to the next conflict" } },
        { "n", "ho",      function() require("diffview.actions").conflict_choose("ours") end,       { desc = "Choose the OURS version of a conflict" } },
        { "n", "ht",      function() require("diffview.actions").conflict_choose("theirs") end,     { desc = "Choose the THEIRS version of a conflict" } },
        { "n", "hb",      function() require("diffview.actions").conflict_choose("base") end,       { desc = "Choose the BASE version of a conflict" } },
        { "n", "ha",      function() require("diffview.actions").conflict_choose("all") end,        { desc = "Choose all the versions of a conflict" } },
        { "n", "dx",      function() require("diffview.actions").conflict_choose("none") end,       { desc = "Delete the conflict region" } },
        { "n", "hO",      function() require("diffview.actions").conflict_choose_all("ours") end,   { desc = "Choose the OURS version of a conflict for the whole file" } },
        { "n", "hT",      function() require("diffview.actions").conflict_choose_all("theirs") end, { desc = "Choose the THEIRS version of a conflict for the whole file" } },
        { "n", "hB",      function() require("diffview.actions").conflict_choose_all("base") end,   { desc = "Choose the BASE version of a conflict for the whole file" } },
        { "n", "hA",      function() require("diffview.actions").conflict_choose_all("all") end,    { desc = "Choose all the versions of a conflict for the whole file" } },
        { "n", "dX",      function() require("diffview.actions").conflict_choose_all("none") end,   { desc = "Delete the conflict region for the whole file" } },
      },
      diff1 = {
        -- Mappings in single window diff layouts
        { "n", "g?", function() require("diffview.actions").help({ "view", "diff1" }) end, { desc = "Open the help panel" } },
      },
      diff2 = {
        -- Mappings in 2-way diff layouts
        { "n", "g?", function() require("diffview.actions").help({ "view", "diff2" }) end, { desc = "Open the help panel" } },
      },
      diff3 = {
        -- Mappings in 3-way diff layouts
        { { "n", "x" }, "2do", function() require("diffview.actions").diffget("ours") end,           { desc = "Obtain the diff hunk from the OURS version of the file" } },
        { { "n", "x" }, "3do", function() require("diffview.actions").diffget("theirs") end,         { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
        { "n",          "g?",  function() require("diffview.actions").help({ "view", "diff3" }) end, { desc = "Open the help panel" } },
      },
      diff4 = {
        -- Mappings in 4-way diff layouts
        { { "n", "x" }, "1do", function() require("diffview.actions").diffget("base") end,           { desc = "Obtain the diff hunk from the BASE version of the file" } },
        { { "n", "x" }, "2do", function() require("diffview.actions").diffget("ours") end,           { desc = "Obtain the diff hunk from the OURS version of the file" } },
        { { "n", "x" }, "3do", function() require("diffview.actions").diffget("theirs") end,         { desc = "Obtain the diff hunk from the THEIRS version of the file" } },
        { "n",          "g?",  function() require("diffview.actions").help({ "view", "diff4" }) end, { desc = "Open the help panel" } },
      },
      file_panel = {
        { "n", "k",         function() require("diffview.actions").next_entry() end,                  { desc = "Bring the cursor to the next file entry" } },
        { "n", "<down>",    function() require("diffview.actions").next_entry() end,                  { desc = "Bring the cursor to the next file entry" } },
        { "n", "l",         function() require("diffview.actions").prev_entry() end,                  { desc = "Bring the cursor to the previous file entry" } },
        { "n", "<up>",      function() require("diffview.actions").prev_entry() end,                  { desc = "Bring the cursor to the previous file entry" } },
        { "n", "<cr>",      function() require("diffview.actions").select_entry() end,                { desc = "Open the diff for the selected entry" } },
        { "n", "m",         function() require("diffview.actions").select_entry() end,                { desc = "Open the diff for the selected entry" } },
        { "n", "-",         function() require("diffview.actions").toggle_stage_entry() end,          { desc = "Stage / unstage the selected entry" } },
        { "n", "s",         function() require("diffview.actions").toggle_stage_entry() end,          { desc = "Stage / unstage the selected entry" } },
        { "n", "S",         function() require("diffview.actions").stage_all() end,                   { desc = "Stage all entries" } },
        { "n", "U",         function() require("diffview.actions").unstage_all() end,                 { desc = "Unstage all entries" } },
        { "n", "X",         function() require("diffview.actions").restore_entry() end,               { desc = "Restore entry to the state on the left side" } },
        { "n", "L",         function() require("diffview.actions").open_commit_log() end,             { desc = "Open the commit log panel" } },
        { "n", "zo",        function() require("diffview.actions").open_fold() end,                   { desc = "Expand fold" } },
        { "n", "h",         function() require("diffview.actions").close_fold() end,                  { desc = "Collapse fold" } },
        { "n", "zc",        function() require("diffview.actions").close_fold() end,                  { desc = "Collapse fold" } },
        { "n", "za",        function() require("diffview.actions").toggle_fold() end,                 { desc = "Toggle fold" } },
        { "n", "zR",        function() require("diffview.actions").open_all_folds() end,              { desc = "Expand all folds" } },
        { "n", "zM",        function() require("diffview.actions").close_all_folds() end,             { desc = "Collapse all folds" } },
        { "n", "<c-b>",     function() require("diffview.actions").scroll_view(-0.25) end,            { desc = "Scroll the view up" } },
        { "n", "<c-f>",     function() require("diffview.actions").scroll_view(0.25) end,             { desc = "Scroll the view down" } },
        { "n", "<tab>",     function() require("diffview.actions").select_next_entry() end,           { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>",   function() require("diffview.actions").select_prev_entry() end,           { desc = "Open the diff for the previous file" } },
        -- { "n", "gf",            function() require("diffview.actions").goto_file_edit() end,              { desc = "Open the file in the previous tabpage" } },
        { "n", "gf",        function() require("diffview.actions").goto_file_split() end,             { desc = "Open the file in a new split" } },
        -- { "n", "<C-w>gf",       function() require("diffview.actions").goto_file_tab() end,               { desc = "Open the file in a new tabpage" } },
        { "n", "i",         function() require("diffview.actions").listing_style() end,               { desc = "Toggle between 'list' and 'tree' views" } },
        { "n", "f",         function() require("diffview.actions").toggle_flatten_dirs() end,         { desc = "Flatten empty subdirectories in tree listing style" } },
        { "n", "R",         function() require("diffview.actions").refresh_files() end,               { desc = "Update stats and entries in the file list" } },
        { "n", "<leader>e", function() require("diffview.actions").focus_files() end,                 { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b", function() require("diffview.actions").toggle_files() end,                { desc = "Toggle the file panel" } },
        { "n", "g<C-x>",    function() require("diffview.actions").cycle_layout() end,                { desc = "Cycle available layouts" } },
        { "n", "[x",        function() require("diffview.actions").prev_conflict() end,               { desc = "Go to the previous conflict" } },
        { "n", "]x",        function() require("diffview.actions").next_conflict() end,               { desc = "Go to the next conflict" } },
        { "n", "g?",        function() require("diffview.actions").help("file_panel") end,            { desc = "Open the help panel" } },
        { "n", "hO",        function() require("diffview.actions").conflict_choose_all("ours") end,   { desc = "Choose the OURS version of a conflict for the whole file" } },
        { "n", "hT",        function() require("diffview.actions").conflict_choose_all("theirs") end, { desc = "Choose the THEIRS version of a conflict for the whole file" } },
        { "n", "hB",        function() require("diffview.actions").conflict_choose_all("base") end,   { desc = "Choose the BASE version of a conflict for the whole file" } },
        { "n", "hA",        function() require("diffview.actions").conflict_choose_all("all") end,    { desc = "Choose all the versions of a conflict for the whole file" } },
        { "n", "dX",        function() require("diffview.actions").conflict_choose_all("none") end,   { desc = "Delete the conflict region for the whole file" } },
      },
      file_history_panel = {
        { "n", "g!",            function() require("diffview.actions").options() end,                  { desc = "Open the option panel" } },
        { "n", "<C-A-d>",       function() require("diffview.actions").open_in_diffview() end,         { desc = "Open the entry under the cursor in a diffview" } },
        { "n", "y",             function() require("diffview.actions").copy_hash() end,                { desc = "Copy the commit hash of the entry under the cursor" } },
        { "n", "L",             function() require("diffview.actions").open_commit_log() end,          { desc = "Show commit details" } },
        { "n", "zR",            function() require("diffview.actions").open_all_folds() end,           { desc = "Expand all folds" } },
        { "n", "zM",            function() require("diffview.actions").close_all_folds() end,          { desc = "Collapse all folds" } },
        { "n", "k",             function() require("diffview.actions").next_entry() end,               { desc = "Bring the cursor to the next file entry" } },
        { "n", "<down>",        function() require("diffview.actions").next_entry() end,               { desc = "Bring the cursor to the next file entry" } },
        { "n", "l",             function() require("diffview.actions").prev_entry() end,               { desc = "Bring the cursor to the previous file entry." } },
        { "n", "<up>",          function() require("diffview.actions").prev_entry() end,               { desc = "Bring the cursor to the previous file entry." } },
        { "n", "<cr>",          function() require("diffview.actions").select_entry() end,             { desc = "Open the diff for the selected entry." } },
        { "n", "o",             function() require("diffview.actions").select_entry() end,             { desc = "Open the diff for the selected entry." } },
        { "n", "m",             function() require("diffview.actions").select_entry() end,             { desc = "Open the diff for the selected entry." } },
        { "n", "<2-LeftMouse>", function() require("diffview.actions").select_entry() end,             { desc = "Open the diff for the selected entry." } },
        { "n", "<c-b>",         function() require("diffview.actions").scroll_view(-0.25) end,         { desc = "Scroll the view up" } },
        { "n", "<c-f>",         function() require("diffview.actions").scroll_view(0.25) end,          { desc = "Scroll the view down" } },
        { "n", "<tab>",         function() require("diffview.actions").select_next_entry() end,        { desc = "Open the diff for the next file" } },
        { "n", "<s-tab>",       function() require("diffview.actions").select_prev_entry() end,        { desc = "Open the diff for the previous file" } },
        -- { "n", "gf",            function() require("diffview.actions").goto_file_edit() end,           { desc = "Open the file in the previous tabpage" } },
        { "n", "gf",            function() require("diffview.actions").goto_file_split() end,          { desc = "Open the file in a new split" } },
        -- { "n", "<C-w>gf",       function() require("diffview.actions").goto_file_tab() end,            { desc = "Open the file in a new tabpage" } },
        { "n", "<leader>e",     function() require("diffview.actions").focus_files() end,              { desc = "Bring focus to the file panel" } },
        { "n", "<leader>b",     function() require("diffview.actions").toggle_files() end,             { desc = "Toggle the file panel" } },
        { "n", "g<C-x>",        function() require("diffview.actions").cycle_layout() end,             { desc = "Cycle available layouts" } },
        { "n", "g?",            function() require("diffview.actions").help("file_history_panel") end, { desc = "Open the help panel" } },
      },
      option_panel = {
        { "n", "<tab>", function() require("diffview.actions").select_entry() end,       { desc = "Change the current option" } },
        { "n", "q",     function() require("diffview.actions").close() end,              { desc = "Close the panel" } },
        { "n", "g?",    function() require("diffview.actions").help("option_panel") end, { desc = "Open the help panel" } },
      },
      help_panel = {
        { "n", "q",     function() require("diffview.actions").close() end, { desc = "Close help menu" } },
        { "n", "<esc>", function() require("diffview.actions").close() end, { desc = "Close help menu" } },
      },
    },
  }
}
