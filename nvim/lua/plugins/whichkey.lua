return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  init = function()
    local whichkey = require('which-key')

    vim.o.timeout = true
    vim.o.timeoutlen = 500

    whichkey.setup()
    whichkey.add({
      { '<leader>d', group = '[D]iagnostics' },
      { '<leader>g', group = '[G]it' },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>o', group = '[O]pen' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' }
    })
  end
}
