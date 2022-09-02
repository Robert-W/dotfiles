local browser_actions = require("telescope").extensions.file_browser.actions
local actions = require("telescope.actions")

require("telescope").setup({
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
      file_ignore_patterns = {
        "node_modules",
        ".git",
      },
    },
    live_grep = {
      hidden = true,
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
        "/.git"
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

require("telescope").load_extension("file_browser")
