vim.pack.add({
  'https://github.com/tpope/vim-fugitive',
})

vim.keymap.set('n', '<leader>gb', ':Git blame <CR>', { desc = '[G]it [B]lame' });
vim.keymap.set('n', '<leader>gs', ':Git status <CR>', { desc = '[G]it [S]tatus' });
vim.keymap.set('n', '<leader>gl', ':Git log % <CR>', { desc = '[G]it [L]og for current file' });
vim.keymap.set('n', '<leader>gd', ':Git diff % <CR>', { desc = '[G]it [D]iff for current file' });
