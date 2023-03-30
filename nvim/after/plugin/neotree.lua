local neotree = require("neo-tree")

-- Neotree remaps
vim.keymap.set('n', ';nt', ":Neotree toggle<cr>")

neotree.setup({
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      hide_dotfiles = false
    }
  }
})
