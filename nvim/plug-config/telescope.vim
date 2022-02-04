nnoremap <silent> ;b <Cmd>Telescope file_browser<CR>
nnoremap <silent> ;f <Cmd>Telescope find_files<CR>
nnoremap <silent> ;r <Cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <Cmd>Telescope buffers<CR>
nnoremap <silent> ;; <Cmd>Telescope help_tags<CR>

lua << EOF
local fb_actions = require 'telescope'.extensions.file_browser.actions
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
  extensions = {
    file_browser = {
      mappings = {
        n = {
          ["<C-c>"] = fb_actions.create,
          ["<C-d>"] = fb_actions.remove,
        },
        i = {
          ["<C-c>"] = fb_actions.create,
          ["<C-d>"] = fb_actions.remove,
        }
      }
    }
  }
}

require("telescope").load_extension "file_browser"
EOF
