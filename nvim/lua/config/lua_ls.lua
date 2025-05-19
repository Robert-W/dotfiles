local M = {}

function M.configure()
  vim.lsp.config('lua_ls', {
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

return M
