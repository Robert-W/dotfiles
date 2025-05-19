local M = {}

function M.configure()
  vim.lsp.config('rust_analyzer', {
    settings = {
      rust_analyzer = {
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
