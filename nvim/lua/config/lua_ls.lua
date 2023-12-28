local M = {}

function M.configure()
  require('lspconfig').lua_ls.setup({
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" }
        },
      }
    }
  })
end

return M
