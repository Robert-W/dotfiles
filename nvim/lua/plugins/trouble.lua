return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    local trouble = require('trouble')

    vim.keymap.set('n', '<leader>dw', function() trouble.open('workspace_diagnostics') end,
      { desc = '[D]iagnostics for [W]orkspace' })
    vim.keymap.set('n', '<leader>df', function() trouble.open('document_diagnostics') end,
      { desc = '[D]iagnostics for [F]ile' })
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float,
      { desc = '[D]iagnostics for [L]ine' })
  end,
}
