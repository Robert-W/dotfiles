local neotree = require("neo-tree")

-- Neotree remaps
vim.keymap.set('n', ';nt', ":Neotree toggle<cr>")

neotree.setup({
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      visible = true,
      hide_dotfiles = false
    }
  }
})
