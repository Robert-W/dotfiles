vim.pack.add({
  'https://github.com/folke/trouble.nvim',
})

require('trouble').setup()

vim.keymap.set('n', '<leader>dw', '<cmd>Trouble diagnostics toggle<cr>',
  { desc = '[D]iagnostics for [W]orkspace' })
vim.keymap.set('n', '<leader>df', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  { desc = '[D]iagnostics for [F]ile' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float,
  { desc = '[D]iagnostics for [L]ine' })
