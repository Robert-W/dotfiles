vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/folke/which-key.nvim' })

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
})
