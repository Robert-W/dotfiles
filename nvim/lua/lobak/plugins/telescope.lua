return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  init = function()
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')
    local telescope = require('telescope')

    local browser_actions = telescope.extensions.file_browser.actions

    -- Setup keymaps for builtins
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch open [B]uffers' })

    -- Setup keymaps for extensions
    vim.keymap.set('n', '<leader>oc', ':Telescope file_browser path=%:p:h=%:p:h<cr>',
      { desc = '[O]pen file browser in current directory' })
    vim.keymap.set('n', '<leader>ow', telescope.extensions.file_browser.file_browser,
      { desc = '[O]pen file browser in workspace directory' })

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
            '.git',
            'target',
          },
        },
        live_grep = {
          hidden = true,
          ignore = false,
          only_sort_text = true,
          file_ignore_patterns = {
            'node_modules',
            'target',
            '.git',
          },
        },
      },
      extensions = {
        file_browser = {
          respect_gitignore = false,
          hidden = true,
          file_ignore_patterns = {
            'node_modules',
            'target',
          },
          mappings = {
            n = {
              ['<C-a>'] = browser_actions.create,
              ['<C-d>'] = browser_actions.remove,
            },
            i = {
              ['<C-a>'] = browser_actions.create,
              ['<C-d>'] = browser_actions.remove,
            },
          },
        },
        fzf = {
          case_mode = "smart_case",
          fuzzy = true,
          override_file_sorter = true,
          override_generic_sorter = true,
        }
      }
    })

    telescope.load_extension('file_browser')
    telescope.load_extension('fzf')
  end,
}
