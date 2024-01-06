return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    local whichkey = require('which-key')

    vim.o.timeout = true
    vim.o.timeoutlen = 500

    whichkey.setup()
  end
}
