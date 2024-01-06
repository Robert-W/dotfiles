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
            globals = { "vim" }
          },
        }
      }
    })
  end
end

return M
