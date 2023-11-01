return {
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    init = function()
      local lsp = require('lsp-zero')
      local lsp_config = require('lspconfig')
      local cmp = require('cmp')
      local mason = require('mason')
      local mason_cfg = require('mason-lspconfig')

      -- Use the recommended presets from lsp-zero
      lsp.preset('recommended')

      -- Setup mason and install some LSP's
      mason.setup({})
      mason_cfg.setup({
        ensure_installed = {
          'cssls',
          'eslint',
          'gopls',
          'html',
          'jsonls',
          'lua_ls',
          'rust_analyzer',
          'sqlls',
          'terraformls',
          'tsserver',
        },
        handlers = {
          lsp.default_setup,
          lua_ls = function() lsp_config.lua_ls.setup(lsp.nvim_lua_ls()) end,
        }
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-q>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = 'E',
          warn = 'W',
          hint = 'H',
          info = 'I'
        }
      })

      lsp.on_attach(function(_, bufnr)
        vim.keymap.set('n', 'gk', vim.lsp.buf.hover,
          { buffer = bufnr, remap = false, desc = 'Show hover information for the symbol' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
          { buffer = bufnr, remap = false, desc = 'Jump to the definition of the symbol' })
        vim.keymap.set('n', 'gm', vim.lsp.buf.implementation,
          { buffer = bufnr, remap = false, desc = 'Show implementation for the symbol' })
        vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>',
          { buffer = bufnr, remap = false, desc = 'Show references to the symbol' })
        vim.keymap.set('n', 'gc', vim.lsp.buf.incoming_calls,
          { buffer = bufnr, remap = false, desc = 'Show call sites of the symbol' })
        vim.keymap.set('n', 'go', vim.lsp.buf.outgoing_calls,
          { buffer = bufnr, remap = false, desc = 'Show items called by the symbol' })
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,
          { buffer = bufnr, remap = false, desc = 'Show signature information' })

        vim.keymap.set('n', 'gp', function() vim.lsp.buf.format({ timeout_ms = 10000 }) end,
          { buffer = bufnr, remap = false, desc = 'Format current buffer with attached LSP' })

        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = 'Rename variable' })
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action,
          { buffer = bufnr, remap = false, desc = 'Perform code actions' })
      end)

      lsp.setup()

      vim.diagnostic.config({ virtual_text = true })

    end,
  }
}
