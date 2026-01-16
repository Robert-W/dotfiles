return {
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

    vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = '[H]arpoon: [A]dd item' })
    vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = '[H]arpoon: [N]ext item' })
    vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = '[H]arpoon: [P]rev item' })

    vim.keymap.set('n', '<leader>hh', function() harpoon:list():select(1) end,
      { desc = '[H]arpoon: [H] Jump to 1st item' })
    vim.keymap.set('n', '<leader>hj', function() harpoon:list():select(2) end,
      { desc = '[H]arpoon: [J] Jump to 2nd item' })
    vim.keymap.set('n', '<leader>hk', function() harpoon:list():select(3) end,
      { desc = '[H]arpoon: [K] Jump to 3rd item' })
    vim.keymap.set('n', '<leader>hl', function() harpoon:list():select(4) end,
      { desc = '[H]arpoon: [L] Jump to 4th item' })
    vim.keymap.set('n', '<leader>th', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = '[T]oggle [H]arpoon' })
  end
}
