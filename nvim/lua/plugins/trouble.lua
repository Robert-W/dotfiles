return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  cmd = 'Trouble',
  keys = {
    {
      '<leader>dw',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = '[D]iagnostics for [W]orkspace'
    },
    {
      '<leader>df',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = '[D]iagnostics for [F]ile'
    },
  },
  init = function()
    vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float,
      { desc = '[D]iagnostics for [L]ine' })
  end,
}
