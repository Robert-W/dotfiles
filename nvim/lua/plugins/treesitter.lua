return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag'
    },
    build = ':TSUpdate',
    init = function()
      local function gonnaSlowMeDown(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 1000
      end

      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'css',
          'go',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'lua',
          'markdown',
          'markdown_inline',
          'regex',
          'rust',
          'sql',
          'terraform',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },
        sync_install = false,
        autotag = {
          enable = true,
        },
        indent = {
          enable = true,
          disable = {},
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, bufnr)
            return gonnaSlowMeDown(lang, bufnr)
          end,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
            }
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_previous_start = {
              ['[f'] = '@function.outer',
              ['[a'] = '@parameter.inner',
            },
            goto_next_start = {
              [']f'] = '@function.outer',
              [']a'] = '@parameter.inner',
            }
          }
        }
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      multiline_threshold = 1
    }
  }
}
