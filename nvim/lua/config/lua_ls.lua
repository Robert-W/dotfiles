local M = {}

function M.configure(capabilities)
  return function()
    require('lspconfig').lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
            disable = {
              'missing-fields'
            }
          },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file('', true),
          },
          completion = {
            callSnippet = 'Replace'
          }
        }
      }
    })
  end
end

return M
