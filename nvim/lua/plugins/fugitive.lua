return {
  'tpope/vim-fugitive',
  init = function()
    vim.keymap.set('n', '<leader>gb', ':Git blame <CR>', { desc = 'Open git blame' });
    vim.keymap.set('n', '<leader>gs', ':Git status <CR>', { desc = 'Open git status' });
    vim.keymap.set('n', '<leader>gl', ':Git log % <CR>', { desc = 'Open git log for current file' });
    vim.keymap.set('n', '<leader>gd', ':Git diff % <CR>', { desc = 'Open git diff for current file' });
  end,
}
