local M = {}

function M.configure(server_name)
  require('lspconfig')[server_name].setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  })
end

return M
