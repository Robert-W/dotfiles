require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",
    "terraformls",
    "sumneko_lua",
    "tsserver",
    "jsonls",
    "cssls",
    "html"
  }
})
