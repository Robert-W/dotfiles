return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- lazy load our snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Additional setup for other snippets
    luasnip.filetype_extend('typescript', { 'javascript' })
    luasnip.filetype_extend('typescript', { 'tsdoc' })
    luasnip.filetype_extend('javascript', { 'jsdoc' })
    luasnip.filetype_extend('lua', { 'luadoc' })
    luasnip.filetype_extend('rust', { 'rustdoc' })

    -- Mappings for completion suggestions
    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-q>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function (fallback)
          if cmp.visible() then
            cmp.mapping.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function (fallback)
          if cmp.visible() then
            cmp.mapping.select_next_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' }
      },
    })
  end
}
