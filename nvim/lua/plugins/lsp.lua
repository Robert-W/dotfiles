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
    },
    config = function()
      local cmp = require('cmp')
      local lspcapabilities = require('cmp_nvim_lsp')
      local lspconfig = require('lspconfig')
      local luasnip = require('luasnip')
      local luasnip_loaders = require('luasnip.loaders.from_vscode')
      local masoncfg = require('mason-lspconfig')
      local registry = require('mason-registry')

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

      -- Other packages in mason we would like to install
      local packages = {
        -- Linters/Formatters
        'shellcheck',
        'shfmt',
        'stylua',
        -- DAP
        'codelldb'
      }

      -- Iterate and install the additional packages
      for _, name in ipairs(packages) do
        local Package = require('mason-core.package')

        local pkg_name, version = Package.Parse(name)
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok and not pkg:is_installed() then
          -- TODO: Wrap this in a utils function and use here if we want auto
          -- updates
          -- if pkg:is_installed() then
          --   if version ~= nil then
          --     pkg:get_installed_version(function(ok, current_version))
          --       if ok and current_version ~= version then
          --         install_servers
          --       end
          --     end
          --   end
          -- else
          --   install_servers
          -- end
          vim.notify(string.format('[mason-packages] installing %s', pkg_name), vim.log.levels.INFO)
          pkg:install({ version = version }):once('closed', vim.schedule_wrap(function ()
            if pkg:is_installed() then
              vim.notify(string.format('[mason-packages] %s was installed', pkg_name), vim.log.levels.INFO)
            else
              vim.notify(string.format('[mason-packages] failed to install %s', pkg_name), vim.log.levels.ERROR)
            end
          end))
        end
      end

      -- Setup all of our LSP servers
      masoncfg.setup_handlers({
        -- default handler for all servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lspcapabilities.default_capabilities()
          })
        end,
        -- override lsp servers here if you need custom implementation
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim" }
                },
              }
            }
          })
        end
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
