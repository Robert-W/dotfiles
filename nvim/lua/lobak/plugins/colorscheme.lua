return {
  'catppuccin/nvim',
  priority = 1000,
  init = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      show_end_of_buffer = true,
      term_colors = true,
      transparent_background = true,
      float = {
        transparent = true
      },
      integrations = {
        aerial = true,
        blink_cmp = true,
        harpoon = true,
        lsp_trouble = true,
        mason = true,
        neotree = true,
        notify = true,
        treesitter = true
      },
      styles = {
        operators = { 'bold' },
        types = { 'bold' },
      }
    })

    -- Set the colorscheme
    vim.cmd('colorscheme catppuccin')

  end,
}
