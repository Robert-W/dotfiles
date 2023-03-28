local neotree = require("neo-tree")

neotree.setup({
  filesystem = {
    follow_current_file = true,
    filtered_items = {
      hide_dotfiles = false
    }
  }
})
