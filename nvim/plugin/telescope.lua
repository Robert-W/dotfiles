local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local telescope = require('telescope')

-- Setup keymaps for builtins
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch open [B]uffers' })

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['<esc>'] = actions.close,
      },
      i = {
        ['<esc>'] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      file_ignore_patterns = {
        'node_modules',
        'target',
        '.git/',
      },
    },
    live_grep = {
      additional_args = function() return { '--hidden', '--no-ignore-vcs' } end,
      only_sort_text = true,
      file_ignore_patterns = {
        'node_modules',
        'target',
        '.git/',
      },
    },
  },
})
