local rust_tools = require('rust-tools')

local M = {}

function M.configure(capabilities)
  return function()
    rust_tools.setup({
      server = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(_, bufnr)
          -- Override any normal keymaps for ones that are improved by rust-tools
          vim.keymap.set('n', 'gk', rust_tools.hover_actions.hover_actions,
            { buffer = bufnr, remap = false, desc = 'Show hover information for the symbol' })
        end
      },
      tools = {
        hover_actions = {
          auto_focus = true
        }
      }
    })
  end
end

return M
