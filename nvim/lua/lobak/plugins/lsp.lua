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
      local blink = require('blink.cmp')

      local servers = {
        'bashls',
        'cssls',
        'eslint',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'rust_analyzer',
        'sqlls',
        'tofu_ls',
        'ts_ls',
        'yamlls',
      }

      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities()
      )

      -- Configure the LSP
      for _, server_name in pairs(servers) do
        vim.lsp.config(server_name, { capabilities = capabilities })
        vim.lsp.enable(server_name)
      end

      -- Mason LSP Config
      masoncfg.setup({
        automatic_enable = false,
        ensure_installed = servers,
      })

      -- Install packages masoncfg cannot, these include linters,
      -- formatters, and DAP packages. These do require additional setup, so
      -- these alone do nothing
      require('lobak.utils.mason-packager').setup({
        ensure_installed = {
          'codelldb',
        }
      })

      -- Use this to setup all of our keybindings when a server attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          -- Helper function for keymaps
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = event.buf, remap = false, desc = 'LSP: ' .. desc })
          end

          map('n', 'gD', vim.lsp.buf.type_definition, '[G]oto Type [D]efinition')
          map('n', 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('n', 'gr', vim.lsp.buf.references, '[G]oto [R]eferences')
          map('n', 'gp', function() vim.lsp.buf.format({ timeout_ms = 10000 }) end, '[G][P] Format current buffer')
          map('n', 'gk', function() vim.lsp.buf.hover({ border = 'rounded' }) end, '[G][K] Hover documentation')
          map('n', '<leader>r', vim.lsp.buf.rename, '[R]ename variable')
          map('n', '<leader>a', vim.lsp.buf.code_action, 'Perform code [A]ctions')
          map('i', '<C-h>', function() vim.lsp.buf.signature_help({ border = 'rounded' }) end, 'Show signature [H]elp')

          -- Enable inlay_hints for the active buffer
          vim.lsp.inlay_hint.enable(true)
        end
      })

    end
  }
}
