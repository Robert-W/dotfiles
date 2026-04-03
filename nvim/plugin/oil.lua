vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
})

local oil = require('oil')

oil.setup({
  view_options = {
    show_hidden = true
  }
})

vim.keymap.set('n', '<leader>to', function() oil.open(nil, { preview = { split = 'belowright' } }, nil) end,
{ desc = '[T]oggle [O]il' })
