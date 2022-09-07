local Remap = require("lobak.keymap")
local nnoremap = Remap.nnoremap
local cmp = require("cmp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup for nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-q>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  }),
})

local function make_config(opts)
  return vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = function()
      nnoremap("gd", function() vim.lsp.buf.definition() end)
      nnoremap("gi", function() vim.lsp.buf.implementation() end)
      nnoremap("gr", "<CMD>Telescope lsp_references<Cr>")
      nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
      nnoremap("gf", function()
        vim.lsp.buf.format({ timeout_ms = 10000, async = false })
      end)
    end
  }, opts or {})
end

-- Configure various language servers
require("lspconfig").tsserver.setup(make_config())
require("lspconfig").cssls.setup(make_config())
require("lspconfig").jsonls.setup(make_config())
require("lspconfig").rust_analyzer.setup(make_config())

-- Customize specific language servers
require("lspconfig").sumneko_lua.setup(make_config({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, "")
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        }
      },
    },
  },
}))
