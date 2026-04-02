-- Here we install most of our plugins. It does not perform any setup actions.
-- If a plugin has dependencies, they should also be added here. Dependencies
-- should have comments so it's easy to know what is using them.
--
-- For plugins that are lazy loaded, I prefix their configuration files with the
-- number 42 (e.g. 42-which-key.lua). Those plugins wait for events to
-- activate/install.
--
-- If a plugin should load earlier than others, prefix their configuration file
-- name with numbers in order of their priority.
-- 00-plugins.lua     -- this loads first
-- 01-colorscheme.lua -- this loads second

vim.pack.add({
  -- My theme and status line
  -- see ./01-colorscheme.lua and ./lualine.lua
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  'https://github.com/nvim-lualine/lualine.nvim',

  -- Treesitter plugins for syntax highlighting and navigation
  -- see ./treesitter.lua
  'http://github.com/nvim-treesitter/nvim-treesitter',
  'http://github.com/nvim-treesitter/nvim-treesitter-context',
  {
    src = 'http://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    version = 'main'
  },

  -- Plugins to add snippets and autocomplete
  -- see ./blink.cmp.lua
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.x')
  },
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/rafamadriz/friendly-snippets',

  -- LSP Plugins for managing servers and configurations
  -- see ./lsp.lua
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',

  -- Plenary is used by telescope, harpoon, and todo comments
  'https://github.com/nvim-lua/plenary.nvim',

  -- telescope is for finding files and code
  -- see ./telescope.lua
  'https://github.com/nvim-lua/popup.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',

  -- Utility for marking commonly accessed files for faster navigation
  -- see ./harpoon.lua
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },

  -- Icons is used by oil and trouble
  -- see ./icons.lua
  'https://github.com/nvim-mini/mini.icons',

  -- Utility for modifying files/directories and looking around
  -- see ./oil.lua
  'https://github.com/stevearc/oil.nvim',

  -- Utility for viewing diagnostics
  -- see ./trouble.lua
  'https://github.com/folke/trouble.nvim',

  -- Adds some git utilities
  -- see ./fugitive.lua
  'https://github.com/tpope/vim-fugitive',
})
