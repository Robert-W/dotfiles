nnoremap <silent> ;b <Cmd>Telescope file_browser<CR>
nnoremap <silent> ;f <Cmd>Telescope find_files<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>

lua << EOF
local actions = require('telescope.actions')

require('telescope').setup {
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
    file_browser = {
      hidden = true
    }
  }
}

require("telescope").load_extension "file_browser"
EOF
