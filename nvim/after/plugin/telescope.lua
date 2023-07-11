local browser_actions = require("telescope").extensions.file_browser.actions
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local telescope = require("telescope")

-- Add some useful remaps
-- Open file browser in the current directory
vim.keymap.set('n', '<leader>c', ':Telescope file_browser path=%:p:h=%:p:h<cr>', { desc = 'Open file browser in current directory' })
vim.keymap.set('n', '<leader>w', telescope.extensions.file_browser.file_browser, { desc = 'Open file browser in workspace folder' })
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Open file picker' })
vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = 'Open global diagnostics' })
vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = 'Global search in workspace folder' })
vim.keymap.set('n', '<leader>;', builtin.help_tags, { desc = 'Open help tags' })
vim.keymap.set('n', '<leader>\\',builtin.buffers, { desc = 'Open buffer picker' })

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