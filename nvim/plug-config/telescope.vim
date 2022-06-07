nnoremap <silent> ;b <cmd>Telescope file_browser<CR>
nnoremap <silent> ;f <cmd>Telescope find_files<CR>
nnoremap <silent> ;r <cmd>Telescope live_grep<CR>
nnoremap <silent> \\ <cmd>Telescope buffers<CR>
nnoremap <silent> ;; <cmd>Telescope help_tags<CR>

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
  pickers = {
    find_files = {
      hidden = true,
      file_ignore_patterns = {
        'node_modules',
        '.git',
      },
    },
    live_grep = {
      hidden = true,
      file_ignore_patterns = {
        'node_modules',
        '.git',
      },
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
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
