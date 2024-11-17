return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  enabled = require('settings').completion == 'blink',

  build = 'cargo build --release',
  opts = {
    -- for keymap, all values may be string | string[]
    -- use an empty table to disable a keymap
    keymap = {
      ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.is_in_snippet() then
            return cmp.accept()
          else
            return cmp.select_next()
          end
        end,
        'snippet_forward',
        'fallback',
      },
      ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
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
      -- list of enabled providers
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
      providers = {
        lsp = {
          name = 'LSP',
          module = 'blink.cmp.sources.lsp',

          --- *All* of the providers have the following options available
          --- NOTE: All of these options may be functions to get dynamic behavior
          --- See the type definitions for more information
          enabled = true, -- whether or not to enable the provider
          transform_items = nil, -- function to transform the items before they're returned
          should_show_items = true, -- whether or not to show the items
          max_items = nil, -- maximum number of items to return
          min_keyword_length = 0, -- minimum number of characters to trigger the provider
          fallback_for = {}, -- if any of these providers return 0 items, it will fallback to this provider
          score_offset = 0, -- boost/penalize the score of the items
          override = nil, -- override the source's functions
        },
        path = {
          name = 'Path',
          module = 'blink.cmp.sources.path',
          score_offset = 3,
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(('#%d:p:h'):format(context.bufnr))
            end,
            show_hidden_files_by_default = false,
          },
        },
        snippets = {
          name = 'Snippets',
          module = 'blink.cmp.sources.snippets',
          score_offset = -3,
          opts = {
            friendly_snippets = true,
            search_paths = { vim.fn.stdpath('config') .. '/snippets' },
            global_snippets = { 'all' },
            extended_filetypes = {},
            ignored_filetypes = {},
          },

          --- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
          -- enabled = function(ctx) return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter end,
        },
        buffer = {
          name = 'Buffer',
          module = 'blink.cmp.sources.buffer',
          fallback_for = { 'lsp' },
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
        draw = {
          align_to_component = 'label', -- or 'none' to disable
          -- Left and right padding, optionally { left, right } for different padding on each side
          padding = 0,
          -- Gap between columns
          gap = 1,

          -- Components to render, grouped by column
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
          },
          -- for a setup similar to nvim-cmp: https://github.com/Saghen/blink.cmp/pull/245#issuecomment-2463659508
          -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },

          -- Definitions for possible components to render. Each component defines:
          --   ellipsis: whether to add an ellipsis when truncating the text
          --   width: control the min, max and fill behavior of the component
          --   text function: will be called for each item
          --   highlight function: will be called only when the line appears on screen
          components = {
            kind_icon = {
              ellipsis = false,
              width = { fill = true },
              text = function(ctx) return " " .. ctx.kind_icon .. " " .. ctx.icon_gap end,
              highlight = function(ctx)
                return 'BlinkCmpKind' .. ctx.kind
              end,
            },

            label = {
              width = { fill = true, max = 60 },
              text = function(ctx) return ctx.label .. ctx.label_detail end,
              highlight = function(ctx)
                -- label and label details
                local highlights = {
                  {
                    0,
                    #ctx.label,
                    group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel',
                  },
                }
                if ctx.label_detail then
                  table.insert(
                    highlights,
                    {
                      #ctx.label,
                      #ctx.label + #ctx.label_detail,
                      group = 'BlinkCmpDetail',
                    }
                  )
                end

                -- characters matched on the label by the fuzzy matcher
                for _, idx in ipairs(ctx.label_matched_indices) do
                  table.insert(
                    highlights,
                    { idx, idx + 1, group = 'BlinkCmpMatch' }
                  )
                end

                return highlights
              end,
            },
          },
          label_description = {
            width = { max = 30 },
            text = function(ctx) return ctx.label_description end,
            highlight = 'BlinkCmpLabelDescription',
          },
        },
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
