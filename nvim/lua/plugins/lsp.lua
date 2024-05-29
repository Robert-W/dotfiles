return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      local masoncfg = require('mason-lspconfig')

      -- Mason LSP Config
      masoncfg.setup({
        automatic_enable = true,
        ensure_installed = {
          'bashls',
          'cssls',
          'elixirls',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'rust_analyzer',
          'sqlls',
          'terraformls',
          'ts_ls',
        },
      })

      -- Install packages masoncfg cannot, these include linters,
      -- formatters, and DAP packages. These do require additional setup, so
      -- these alone do nothing
      require('utils.mason-packager').setup({
        ensure_installed = {
          'codelldb',
        }
      })

      -- Setup all of our LSP servers
      require('config.lua_ls').configure()
      require('config.rust_analyzer').configure()
      require('config.ts_ls').configure()

      -- Use this to setup all of our keybindings when a server attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local builtin = require('telescope.builtin')
          -- Helper function for keymaps
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = event.buf, remap = false, desc = 'LSP: ' .. desc })
          end

          map('n', 'gD', builtin.lsp_type_definitions, '[G]oto Type [D]efinition')
          map('n', 'gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
          map('n', 'gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          map('n', 'gr', builtin.lsp_references, '[G]oto [R]eferences')
          map('n', 'gp', function() vim.lsp.buf.format({ timeout_ms = 10000 }) end, '[G][P] Format current buffer')
          map('n', 'gk', function() vim.lsp.buf.hover({ border = 'rounded' }) end, '[G][K] Hover documentation')
          map('n', '<leader>r', vim.lsp.buf.rename, '[R]ename variable')
          map('n', '<leader>a', vim.lsp.buf.code_action, 'Perform code [A]ctions')
          map('i', '<C-h>', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, 'Show signature [H]elp')

          -- Enable inlay_hints for the active buffer
          vim.lsp.inlay_hint.enable(true)

          -- vim.keymap.set('n', 'gc', vim.lsp.buf.incoming_calls,
          --   { buffer = bufnr, remap = false, desc = 'Show call sites of the symbol' })
          -- vim.keymap.set('n', 'go', vim.lsp.buf.outgoing_calls,
          --   { buffer = bufnr, remap = false, desc = 'Show items called by the symbol' })
        end
      })

      -- Enable virtual text globally
      vim.diagnostic.config({ virtual_text = true })
    end
  }
}
