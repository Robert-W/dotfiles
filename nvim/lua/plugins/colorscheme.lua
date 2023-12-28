return {
  'catppuccin/nvim',
  priority = 1000,
  init = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      integrations = {
        aerial = true,
        lsp_trouble = true,
        mason = true,
        notify = true,
      },
      transparent_background = true
    })

    vim.cmd('colorscheme catppuccin')
  end,
}
