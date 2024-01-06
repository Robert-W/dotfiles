local M = {}

function M.configure(capabilities)
  return function (server_name)
    require('lspconfig')[server_name].setup({
      capabilities = capabilities
    })
  end
end

return M
