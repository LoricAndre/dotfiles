local vim = vim

local function set_highlights()
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#282C34', fg = 'NONE' })
  vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#C5CDD9', bg = '#22252A' })

  vim.api.nvim_set_hl(
    0,
    'CmpItemAbbrDeprecated',
    { fg = '#7E8294', bg = 'NONE', strikethrough = true }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemAbbrMatch',
    { fg = '#82AAFF', bg = 'NONE', bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemAbbrMatchFuzzy',
    { fg = '#82AAFF', bg = 'NONE', bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemMenu',
    { fg = '#C792EA', bg = 'NONE', italic = true }
  )

  vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#EED8DA', bg = '#B5585F' })
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindProperty',
    { fg = '#EED8DA', bg = '#B5585F' }
  )
  vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = '#EED8DA', bg = '#B5585F' })

  vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = '#C3E88D', bg = '#9FBD73' })
  vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = '#C3E88D', bg = '#9FBD73' })
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindKeyword',
    { fg = '#C3E88D', bg = '#9FBD73' }
  )

  vim.api.nvim_set_hl(
    0,
    'CmpItemKindConstant',
    { fg = '#FFE082', bg = '#D4BB6C' }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindConstructor',
    { fg = '#FFE082', bg = '#D4BB6C' }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindReference',
    { fg = '#FFE082', bg = '#D4BB6C' }
  )

  vim.api.nvim_set_hl(
    0,
    'CmpItemKindFunction',
    { fg = '#EADFF0', bg = '#A377BF' }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindStruct',
    { fg = '#EADFF0', bg = '#A377BF' }
  )
  vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#EADFF0', bg = '#A377BF' })
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindModule',
    { fg = '#EADFF0', bg = '#A377BF' }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindOperator',
    { fg = '#EADFF0', bg = '#A377BF' }
  )

  vim.api.nvim_set_hl(
    0,
    'CmpItemKindVariable',
    { fg = '#C5CDD9', bg = '#7E8294' }
  )
  vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = '#C5CDD9', bg = '#7E8294' })

  vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = '#F5EBD9', bg = '#D4A959' })
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindSnippet',
    { fg = '#F5EBD9', bg = '#D4A959' }
  )
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindFolder',
    { fg = '#F5EBD9', bg = '#D4A959' }
  )

  vim.api.nvim_set_hl(
    0,
    'CmpItemKindMethod',
    { fg = '#DDE5F5', bg = '#6C8ED4' }
  )
  vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = '#DDE5F5', bg = '#6C8ED4' })
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindEnumMember',
    { fg = '#DDE5F5', bg = '#6C8ED4' }
  )

  vim.api.nvim_set_hl(
    0,
    'CmpItemKindInterface',
    { fg = '#D8EEEB', bg = '#58B5A8' }
  )
  vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = '#D8EEEB', bg = '#58B5A8' })
  vim.api.nvim_set_hl(
    0,
    'CmpItemKindTypeParameter',
    { fg = '#D8EEEB', bg = '#58B5A8' }
  )
end

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-path', lazy = true },
    { 'hrsh7th/cmp-buffer', lazy = true },
    { 'hrsh7th/cmp-nvim-lsp', lazy = true },
    { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol', lazy = true },
    { 'hrsh7th/cmp-nvim-lua', lazy = true },
    { 'davidsierradz/cmp-conventionalcommits', lazy = true },
    { 'rafamadriz/friendly-snippets', lazy = true },
    { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim', lazy = true },
    {
      'saadparwaiz1/cmp_luasnip',
      dependencies = {
        { 'L3MON4D3/LuaSnip', lazy = true },
        { 'rafamadriz/friendly-snippets', lazy = true },
      },
      lazy = true,
    },
    { 'onsails/lspkind-nvim', lazy = true },
  },
  event = 'VeryLazy',
  enabled = require('settings').completion == 'cmp',
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()

    set_highlights()

    local opts = {
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          vim_item.dup = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
          }
          local kind = require('lspkind').cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
          })(entry, vim_item)
          local strings = vim.split(kind.kind, '%s', { trimempty = true })
          kind.kind = ' ' .. (strings[1] or '') .. ' '
          kind.menu = '    (' .. (strings[2] or '') .. ')'

          return kind
        end,
      },
      snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },
      window = {
        completion = {
          winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
          col_offset = -3,
          side_padding = 0,
        },
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
              })
            end
          else
            fallback()
          end
        end),

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'nvim_lsp_signature_help' },
      }),
    }
    require('cmp').setup(opts)
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
        { name = 'conventionalcommits' },
      }, {
        { name = 'buffer' },
      }),
    })
  end,
}
