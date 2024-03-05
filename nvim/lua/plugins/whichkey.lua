return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  init = function()
    local whichkey = require('which-key')

    vim.o.timeout = true
    vim.o.timeoutlen = 500

    whichkey.setup()
    whichkey.register({
      ['<leader>d'] = { name = '[D]iagnostics' },
      ['<leader>g'] = { name = '[G]it' },
      ['<leader>h'] = { name = '[H]arpoon' },
      ['<leader>o'] = { name = '[O]pen' },
      ['<leader>s'] = { name = '[S]earch' },
      ['<leader>t'] = { name = '[T]oggle' }
    })
  end
}
