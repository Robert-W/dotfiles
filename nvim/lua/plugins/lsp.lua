return {
  -- Mason Package manager
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  -- Mason LSP Config and Completion Support
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      -- Additional packages related to LSP
      'simrat39/rust-tools.nvim'
    },
    config = function()
      local cmp = require('cmp')
      local lspcapabilities = require('cmp_nvim_lsp')
      local lspconfig = require('lspconfig')
      local luasnip = require('luasnip')
      local luasnip_loaders = require('luasnip.loaders.from_vscode')
      local masoncfg = require('mason-lspconfig')
      local masonpkgr = require('utils.mason-packager')

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      -- lazy load our snippets
      luasnip_loaders.lazy_load()

      -- Mappings for completion suggestions
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-q>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        }
      })

      -- Mason LSP Config
      masoncfg.setup({
        ensure_installed = {
          'bashls',
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
        }
      })

      -- Install packages masoncfg cannot, these include linters,
      -- formatters, and DAP packages. These do require additional setup, so
      -- these alone do nothing
      masonpkgr.setup({
        ensure_installed = {
          'codelldb',
        }
      })

      -- Setup all of our LSP servers
      masoncfg.setup_handlers({
        -- default handler for all servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lspcapabilities.default_capabilities()
          })
        end,
        -- override lsp servers here if you need custom implementation
        ["lua_ls"] = require('config.lua_ls').configure
      })

      -- Use this to setup all of our keybindings when a server attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local bufnr = event.buf

          -- normal mode keymaps
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
          vim.keymap.set('n', 'gp', function() vim.lsp.buf.format({ timeout_ms = 10000 }) end,
            { buffer = bufnr, remap = false, desc = 'Format current buffer with attached LSP' })
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename,
            { buffer = bufnr, remap = false, desc = 'Rename variable' })
          vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action,
            { buffer = bufnr, remap = false, desc = 'Perform code actions' })

          -- insert mode keymaps
          vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,
            { buffer = bufnr, remap = false, desc = 'Show signature information' })
        end
      })

      -- Enable virtual text globally
      vim.diagnostic.config({ virtual_text = true })
    end
  }
}
