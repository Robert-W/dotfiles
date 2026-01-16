return {
  'stevearc/oil.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  lazy = false,
  config = function()
    local oil = require('oil')

    oil.setup({
      view_options = {
        show_hidden = true
      }
    })

    vim.keymap.set('n', '<leader>oo', function() oil.open(nil, { preview = { split = 'belowright' } }, nil) end,
      { desc = '[O]pen [O]il' })
  end
}
