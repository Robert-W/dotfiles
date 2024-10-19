local M = {}

function M.configure(capabilities)
  return function()
    require('lspconfig').ts_ls.setup({
      capabilities = capabilities,
      init_options = {
        preferences = {
          includeInlayEnumMemberValueHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayVariableTypeHints = true,
        }
      }
    })
  end
end

return M
