local M = {}

function M.configure()
  vim.lsp.config('rust_analyzer', {
    settings = {
      ["rust-analyzer"] = {
        inlayhints = {
          parameterhints = {
            enable = false
          }
        }
      }
    }
  })
end

return M
