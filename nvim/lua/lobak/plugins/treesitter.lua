return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    init = function()
      local ensure_installed = {
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
      }

      local already_installed = require("nvim-treesitter.config").get_installed()
      local to_install = vim.iter(ensure_installed)
          :filter(function(parser) return not vim.tbl_contains(already_installed, parser) end)
          :totable()

      require('nvim-treesitter').install(to_install)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      multiline_threshold = 1
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
        },
        move = {
          set_jumps = true,
        }
      })

      -- Setup keymaps for text objects
      local select = require('nvim-treesitter-textobjects.select')
      local move = require('nvim-treesitter-textobjects.move')
      local group = 'textobjects'

      vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', group) end,
        { desc = '[A]round [F]unction' })
      vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', group) end,
        { desc = '[I]nside [F]unction' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', group) end,
        { desc = '[A]round [C]lass' })
      vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', group) end,
        { desc = '[I]nside [C]lass' })
      vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', group) end,
        { desc = '[A]round [P]arameter' })
      vim.keymap.set({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', group) end,
        { desc = '[I]nside [P]arameter' })

      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() move.goto_previous_start('@function.outer', group) end,
        { desc = 'Previous function outer' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[a', function() move.goto_previous_start('@function.inner', group) end,
        { desc = 'Previous function inner' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() move.goto_next_start('@function.outer', group) end,
        { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']a', function() move.goto_next_start('@function.inner', group) end,
        { desc = 'Next function inner' })
    end
  }
}
