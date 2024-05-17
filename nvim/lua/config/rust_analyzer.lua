local M = {}

function M.configure(capabilities)
  return function ()
    require('lspconfig').rust_analyzer.setup({
      capabilities = capabilities,
      settings = {
        ["rust_analyzer"] = {
          inlayHints = {
            parameterHints = {
              enable = false
            }
          }
        }
      }
    })
  end
end

return M
