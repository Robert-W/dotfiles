local M = {}

local inlay_hints = {
  includeInlayEnumMemberValueHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayVariableTypeHints = false,
}

function M.configure(capabilities)
  return function()
    require('lspconfig').tsserver.setup({
      capabilities = capabilities,
      settings = {
        javascript = {
          inlay_hints = inlay_hints
        },
        typescript = {
          inlay_hints = inlay_hints
        }
      }
    })
  end
end

return M
