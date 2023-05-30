local lsp = require('lsp-zero')
local cmp = require('cmp')

-- Use the recommended presets from lsp-zero
lsp.preset('recommended')

-- Install LSP
lsp.ensure_installed({
  'rust_analyzer',
  'terraformls',
  'tsserver',
  'eslint',
  'lua_ls',
  'jsonls',
  'cssls',
  'html',
})

-- Fix undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
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

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- if client.name == 'eslint' then
  --   vim.cmd.LspStop('eslint')
  --   return
  -- end

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts)
  vim.keymap.set('n', 'gk', '<Cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
  -- Decide if we want to remove these and/or LSPSaga. Starting keymaps with
  -- o or i can cause slowness in the editor anytime we use o or i
  -- vim.keymap.set('n', 'ic', '<Cmd>Lspsaga incoming_calls<CR>', opts)
  -- vim.keymap.set('n', 'oc', '<Cmd>Lspsaga outgoing_calls<CR>', opts)
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

  vim.keymap.set('n', 'gf', function ()
    vim.lsp.buf.format({ timeout_ms = 10000 })
  end, opts)

  vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)
  vim.keymap.set('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
  vim.keymap.set('n', '<leader>e', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  vim.keymap.set('n', '<leader>E', '<Cmd>Lspsaga show_buf_diagnostics<CR>', opts)

  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

end)

lsp.setup()

vim.diagnostic.config({ virtual_text = true })