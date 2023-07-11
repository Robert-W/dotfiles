vim.keymap.set('n', '<leader>b', ':Git blame <CR>', { desc = 'Open git blame' });
vim.keymap.set('n', '<leader>v', ':Git status <CR>', { desc = 'Open git status' });
vim.keymap.set('n', '<leader>h', ':Git log -- % <CR>', { desc = 'Open git log for current file' });
