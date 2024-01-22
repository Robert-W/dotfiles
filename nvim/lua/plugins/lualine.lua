return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      section_separators = { left = '', right = '' },
      component_separators = { left = '|', right = '|' },
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = {
        {
          'filename',
          path = 1
        },
      },
      lualine_x = {
        {
          'diagnostics',
          sources = { "nvim_lsp" },
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' '
          }
        },
        'diff',
        'encoding',
        'filetype'
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = { 'fugitive' }
  }
}
