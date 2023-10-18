return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        section_separators = { '', '' },
        component_separators = { '', '' },
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
  },
  {
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {
        map = '<C-a>'
      }
    }
  },
  {
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
  },
  {
    'catppuccin/nvim',
    priority = 1000,
    init = function()
      vim.cmd('colorscheme catppuccin-mocha')
    end,
  }
}
