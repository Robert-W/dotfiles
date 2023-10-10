return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    init = function()
      local function gonnaSlowMeDown(_, bufnr)
        return vim.api.nvim_buf_line_count(bufnr) > 1000
      end

      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'css',
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
          'typescript',
          'vim',
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
