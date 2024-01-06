return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    local neotree = require('neo-tree')

    -- Neotree remaps
    vim.keymap.set('n', '<leader>ot', ':Neotree toggle<cr>', { desc = 'Toggle Neotree' })

    neotree.setup({
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false
        }
      }
    })
  end,
}
