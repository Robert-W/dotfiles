return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  init = function()
    local hooks = require('ibl.hooks')
    -- Setup our highlight sequence
    local highlight = {
      'iYellow',
      'iRed',
      'iCyan',
      'iRose',
      'iGreen',
      'iPurple'
    }

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'iYellow', { fg = '#F9D791' })
      vim.api.nvim_set_hl(0, 'iRed', { fg = '#D27E99' })
      vim.api.nvim_set_hl(0, 'iCyan', { fg = '#A3D4D5' })
      vim.api.nvim_set_hl(0, 'iRose', { fg = '#D9A594' })
      vim.api.nvim_set_hl(0, 'iGreen', { fg = '#6A9589' })
      vim.api.nvim_set_hl(0, 'iPurple', { fg = '#766B90' })
    end)

    require('ibl').setup({
      indent = {
        highlight = highlight
      },
      scope = {
        enabled = true
      }
    })
  end,
}
