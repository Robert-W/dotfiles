local browser_actions = require("telescope").extensions.file_browser.actions
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local telescope = require("telescope")

-- Add some useful remaps
-- Open file browser in the current directory
vim.keymap.set('n', ';bc', ":Telescope file_browser path=%:p:h=%:p:h<cr>")
vim.keymap.set('n', ';br', telescope.extensions.file_browser.file_browser)
vim.keymap.set('n', ';f', builtin.find_files)
vim.keymap.set('n', ';d', builtin.diagnostics)
vim.keymap.set('n', ';r', builtin.live_grep)
vim.keymap.set('n', ';;', builtin.help_tags)
vim.keymap.set('n', ';\\',builtin.buffers)

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