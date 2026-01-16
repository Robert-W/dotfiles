return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function ()
      local luasnip = require('luasnip')

      -- lazy load our snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      -- Additional setup for other snippets
      luasnip.filetype_extend('typescript', { 'javascript' })
      luasnip.filetype_extend('typescript', { 'tsdoc' })
      luasnip.filetype_extend('javascript', { 'jsdoc' })
      luasnip.filetype_extend('lua', { 'luadoc' })
      luasnip.filetype_extend('rust', { 'rustdoc' })
    end
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip' },
    opts = {
      appearance = {
        nerd_font_variant = 'normal'
      },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200
        }
      },
      keymap = {
        ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-q>'] = { 'cancel', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<Tab>'] = {
          function (cmp)
            local luasnip = require('luasnip')
            if cmp.is_menu_visible() then return cmp.select_next()
            elseif luasnip.locally_jumpable(1) then return luasnip.jump(1)
            end
          end,
          'fallback_to_mappings'
        },
        ['<S-Tab>'] = {
          function (cmp)
            local luasnip = require('luasnip')
            if cmp.is_menu_visible() then return cmp.select_prev()
            elseif luasnip.locally_jumpable(-1) then return luasnip.jump(-1)
            end
          end,
          'fallback_to_mappings'
        },
      },
      snippets = {
        preset = 'luasnip'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      }
    },
  }
}
