local lspcapabilities = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

local M = {}

function M.configure()
  lspconfig.lua_ls.setup({
    capabilities = lspcapabilities.default_capabilities(),
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
