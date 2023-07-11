local neotree = require('neo-tree')

-- Neotree remaps
vim.keymap.set('n', '<leader>t', ':Neotree toggle<cr>', { desc = 'Toggle Neotree' })

neotree.setup({
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      visible = true,
      hide_dotfiles = false
    }
  }
})
