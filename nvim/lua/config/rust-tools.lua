local rust_tools = require('rust-tools')

local M = {}

function M.configure()
  rust_tools.setup({
    server = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
      on_attach = function(_, bufnr)
        -- Override some of our normal keymaps for ones that are improved
        -- by rust-tools
        vim.keymap.set('n', 'gk', rust_tools.hover_actions.hover_actions,
          { buffer = bufnr, remap = false, desc = 'Show hover information for the symbol' })
        vim.keymap.set('n', '<leader>a', rust_tools.code_action_group.code_action_group,
          { buffer = bufnr, remap = false, desc = 'Perform code actions' })
      end
    },
    tools = {
      hover_actions = {
        auto_focus = true
      }
    }
  })
end

return M
