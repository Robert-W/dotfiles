return {
  'stevearc/aerial.nvim',
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  init = function()
    -- Setup aerial and then add a keymap for it
    require('aerial').setup({
      on_attach = function(bufnr)
        vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
        vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
      end,
      filter_kind = false,
      layout = {
        width = 35
      }
    })

    vim.keymap.set('n', '<leader>ta', '<cmd>AerialToggle!<CR>', { desc = '[T]oggle [A]erial' })
  end
}
