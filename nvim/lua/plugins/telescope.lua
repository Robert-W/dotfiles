return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    init = function()
      local actions = require("telescope.actions")
      local browser_actions = require("telescope").extensions.file_browser.actions
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")

      -- Add some useful remaps
      vim.keymap.set('n', '<leader>oc', ':Telescope file_browser path=%:p:h=%:p:h<cr>',
        { desc = 'open file browser in current directory' })
      vim.keymap.set('n', '<leader>ow', telescope.extensions.file_browser.file_browser,
        { desc = 'Open file browser in workspace folder' })
      vim.keymap.set('n', '<leader>of', builtin.find_files, { desc = 'Open file picker' })
      vim.keymap.set('n', '<leader>o;', builtin.help_tags, { desc = 'Open help tags' })
      vim.keymap.set('n', '<leader>o\\', builtin.buffers, { desc = 'Open buffer picker' })
      vim.keymap.set('n', '<leader>os', builtin.live_grep, { desc = 'Open live grep' })

      telescope.setup({
        defaults = {
          mappings = {
            n = {
              ["<esc>"] = actions.close,
            },
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = {
              "node_modules",
              ".git",
            },
          },
          live_grep = {
            hidden = true,
            ignore = false,
            only_sort_text = true,
            file_ignore_patterns = {
              "node_modules",
              ".git",
            },
          },
        },
        extensions = {
          file_browser = {
            respect_gitignore = false,
            hidden = true,
            file_ignore_patterns = {
              "node_modules",
            },
            mappings = {
              n = {
                ["<C-c>"] = browser_actions.create,
                ["<C-d>"] = browser_actions.remove,
              },
              i = {
                ["<C-c>"] = browser_actions.create,
                ["<C-d>"] = browser_actions.remove,
              },
            },
          },
        }
      })

      telescope.load_extension("file_browser")
    end,
  },
}
