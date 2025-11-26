return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets'
  },
  opts = {
    appearance = {
      nerd_font_variant = 'normal'
    },
    completion = {
      documentation = {
        auto_show = true
      }
    },
    keymap = {
      ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-c>'] = { 'cancel', 'fallback' },
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    },
    snippets = {
      preset = 'luasnip'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    }
  },
  config = function(_, opts)
    local luasnip = require('luasnip')

    -- lazy load our snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Additional setup for other snippets
    luasnip.filetype_extend('typescript', { 'javascript' })
    luasnip.filetype_extend('typescript', { 'tsdoc' })
    luasnip.filetype_extend('javascript', { 'jsdoc' })
    luasnip.filetype_extend('lua', { 'luadoc' })
    luasnip.filetype_extend('rust', { 'rustdoc' })

    -- Setup blink
    require('blink.cmp').setup(opts)
  end
}
