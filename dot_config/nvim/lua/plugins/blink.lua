local function set_highlights()
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#282C34', fg = 'NONE' })
  vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#C5CDD9', bg = '#22252A' })

  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemAbbrDeprecated',
    { fg = '#7E8294', bg = 'NONE', strikethrough = true }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemAbbrMatch',
    { fg = '#82AAFF', bg = 'NONE', bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemAbbrMatchFuzzy',
    { fg = '#82AAFF', bg = 'NONE', bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemMenu',
    { fg = '#C792EA', bg = 'NONE', italic = true }
  )

  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindField', { fg = '#EED8DA', bg = '#B5585F' })
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindProperty',
    { fg = '#EED8DA', bg = '#B5585F' }
  )
  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindEvent', { fg = '#EED8DA', bg = '#B5585F' })

  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindText', { fg = '#C3E88D', bg = '#9FBD73' })
  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindEnum', { fg = '#C3E88D', bg = '#9FBD73' })
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindKeyword',
    { fg = '#C3E88D', bg = '#9FBD73' }
  )

  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindConstant',
    { fg = '#FFE082', bg = '#D4BB6C' }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindConstructor',
    { fg = '#FFE082', bg = '#D4BB6C' }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindReference',
    { fg = '#FFE082', bg = '#D4BB6C' }
  )

  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindFunction',
    { fg = '#EADFF0', bg = '#A377BF' }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindStruct',
    { fg = '#EADFF0', bg = '#A377BF' }
  )
  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindClass', { fg = '#EADFF0', bg = '#A377BF' })
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindModule',
    { fg = '#EADFF0', bg = '#A377BF' }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindOperator',
    { fg = '#EADFF0', bg = '#A377BF' }
  )

  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindVariable',
    { fg = '#C5CDD9', bg = '#7E8294' }
  )
  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindFile', { fg = '#C5CDD9', bg = '#7E8294' })

  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindUnit', { fg = '#F5EBD9', bg = '#D4A959' })
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindSnippet',
    { fg = '#F5EBD9', bg = '#D4A959' }
  )
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindFolder',
    { fg = '#F5EBD9', bg = '#D4A959' }
  )

  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindMethod',
    { fg = '#DDE5F5', bg = '#6C8ED4' }
  )
  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindValue', { fg = '#DDE5F5', bg = '#6C8ED4' })
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindEnumMember',
    { fg = '#DDE5F5', bg = '#6C8ED4' }
  )

  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindInterface',
    { fg = '#D8EEEB', bg = '#58B5A8' }
  )
  vim.api.nvim_set_hl(0, 'BlinkCmpItemKindColor', { fg = '#D8EEEB', bg = '#58B5A8' })
  vim.api.nvim_set_hl(
    0,
    'BlinkCmpItemKindTypeParameter',
    { fg = '#D8EEEB', bg = '#58B5A8' }
  )
end

return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  enabled = require('settings').completion == 'blink',

  -- use a release tag to download pre-built binaries
  -- version = 'v0.*',
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  build = 'cargo build --release',
  config = function(plugin, opts)
    set_highlights()
    return require('blink-cmp').setup(opts)
  end,
  opts = {
    -- for keymap, all values may be string | string[]
    -- use an empty table to disable a keymap
    keymap = {
      show = '<C-space>',
      hide = '<C-e>',
      accept = '<CR>',
      select_prev = { '<S-Tab>' },
      select_next = { '<Tab>' },
      show_documentation = {},
      hide_documentation = {},
      scroll_documentation_up = '<C-b>',
      scroll_documentation_down = '<C-f>',

      snippet_forward = '<Tab>',
      snippet_backward = '<S-Tab>',
    },

    accept = {
      create_undo_point = true,
      auto_brackets = {
        enabled = true,
        default_brackets = { '(', ')' },
        override_brackets_for_filetypes = {},
        -- Overrides the default blocked filetypes
        force_allow_filetypes = {},
        blocked_filetypes = {},
        -- Synchronously use the kind of the item to determine if brackets should be added
        kind_resolution = {
          enabled = true,
          blocked_filetypes = {
            'typescript',
            'typescriptreact',
            'javascript',
            'javascriptreact',
            'vue',
          },
        },
        -- Asynchronously use semantic token to determine if brackets should be added
        semantic_token_resolution = {
          enabled = true,
          blocked_filetypes = {},
        },
      },
    },

    trigger = {
      completion = {
        -- regex used to get the text when fuzzy matching
        -- changing this may break some sources, so please report if you run into issues
        -- todo: shouldnt this also affect the accept command? should this also be per language?
        keyword_regex = '[%w_\\-]',
        -- LSPs can indicate when to show the completion window via trigger characters
        -- however, some LSPs (*cough* tsserver *cough*) return characters that would essentially
        -- always show the window. We block these by default
        blocked_trigger_characters = { ' ', '\n', '\t' },
        -- when true, will show the completion window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
      },

      signature_help = {
        enabled = true,
        blocked_trigger_characters = {},
        blocked_retrigger_characters = {},
        -- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
      },
    },

    fuzzy = {
      -- frencency tracks the most recently/frequently used items and boosts the score of the item
      use_frecency = true,
      -- proximity bonus boosts the score of items with a value in the buffer
      use_proximity = true,
      max_items = 200,
      -- controls which sorts to use and in which order, these three are currently the only allowed options
      sorts = { 'label', 'kind', 'score' },
    },

    sources = {
      -- similar to nvim-cmp's sources, but we point directly to the source's lua module
      -- multiple groups can be provided, where it'll fallback to the next group if the previous
      -- returns no completion items
      -- WARN: This API will have breaking changes during the beta
      providers = {
        { 'blink.cmp.sources.lsp', name = 'LSP' },
        { 'blink.cmp.sources.path', name = 'Path', score_offset = 3 },
        { 'blink.cmp.sources.snippets', name = 'Snippets', score_offset = -3 },
        {
          'blink.cmp.sources.buffer',
          name = 'Buffer',
          fallback_for = { 'LSP' },
        },
      },
    },

    windows = {
      autocomplete = {
        min_width = 30,
        max_width = 60,
        max_height = 10,
        border = 'none',
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        -- keep the cursor X lines away from the top/bottom of the window
        scrolloff = 2,
        -- which directions to show the window,
        -- falling back to the next direction when there's not enough space
        direction_priority = { 's', 'n' },
        -- Controls how the completion items are rendered on the popup window
        -- 'simple' will render the item's kind icon the left alongside the label
        -- 'reversed' will render the label on the left and the kind icon + name on the right
        -- 'function(blink.cmp.CompletionRenderContext): blink.cmp.Component[]' for custom rendering
        draw = 'simple',
        selection = 'auto_insert',
        cycle = {
          -- When `true`, calling `select_next` at the *bottom* of the completion list will select the *first* completion item.
          from_bottom = true,
          -- When `true`, calling `select_prev` at the *top* of the completion list will select the *last* completion item.
          from_top = true,
        },
      },
      documentation = {
        min_width = 10,
        max_width = 60,
        max_height = 20,
        border = 'padded',
        winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
        -- which directions to show the documentation window,
        -- for each of the possible autocomplete window directions,
        -- falling back to the next direction when there's not enough space
        direction_priority = {
          autocomplete_north = { 'e', 'w', 'n', 's' },
          autocomplete_south = { 'e', 'w', 's', 'n' },
        },
        auto_show = true,
        auto_show_delay_ms = 500,
        update_delay_ms = 100,
      },
      signature_help = {
        min_width = 1,
        max_width = 100,
        max_height = 10,
        border = 'padded',
        winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
      },
    },

    highlight = {
      ns = vim.api.nvim_create_namespace('blink_cmp'),
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = true,
    },

    -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',

    kind_icons = {
      Text = '󰉿',
      Method = '󰊕',
      Function = '󰊕',
      Constructor = '󰒓',

      Field = '󰜢',
      Variable = '󰆦',
      Property = '󰖷',

      Class = '󱡠',
      Interface = '󱡠',
      Struct = '󱡠',
      Module = '󰅩',

      Unit = '󰪚',
      Value = '󰦨',
      Enum = '󰦨',
      EnumMember = '󰦨',

      Keyword = '󰻾',
      Constant = '󰏿',

      Snippet = '󱄽',
      Color = '󰏘',
      File = '󰈔',
      Reference = '󰬲',
      Folder = '󰉋',
      Event = '󱐋',
      Operator = '󰪚',
      TypeParameter = '󰬛',
    },
  },
}
