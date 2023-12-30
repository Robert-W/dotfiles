return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      local harpoon = require('harpoon')

      harpoon:setup({
        settings = {
          save_on_toggle = true
        }
      })

      vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = 'Append to harpoon' })
      vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = 'Next item in harpoon' })
      vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = 'Prev item in harpoon' })
      vim.keymap.set('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = 'Edit harpoon menu' })

      -- Jump to specific entries in harpoon, up to 4
      vim.keymap.set('n', '<leader>hh', function() harpoon:list():select(1) end, { desc = 'Jump to 1st item in harpoon' })
      vim.keymap.set('n', '<leader>hj', function() harpoon:list():select(2) end, { desc = 'Jump to 2nd item in harpoon' })
      vim.keymap.set('n', '<leader>hk', function() harpoon:list():select(3) end, { desc = 'Jump to 3rd item in harpoon' })
      vim.keymap.set('n', '<leader>hl', function() harpoon:list():select(4) end, { desc = 'Jump to 4th item in harpoon' })
    end
  }
}
