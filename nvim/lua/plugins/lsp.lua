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
      -- Additional packages that we need so we can configure them here
      'simrat39/rust-tools.nvim'
    },
    config = function()
      local masoncfg = require('mason-lspconfig')

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
      require('utils.mason-packager').setup({
        ensure_installed = {
          'codelldb',
        }
      })

      -- Setup all of our LSP servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      masoncfg.setup_handlers({
        -- default handler for all servers
        require('config.default_lsp').configure(capabilities),
        -- override lsp servers here if you need custom implementation
        ["lua_ls"] = require('config.lua_ls').configure(capabilities),
        ["rust_analyzer"] = require('config.rust-tools').configure(capabilities)
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
