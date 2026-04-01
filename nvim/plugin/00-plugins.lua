-- This file is where we add all of our plugins. This just installs them, it
-- does not setup any of them. If a plugin has dependencies, make sure to add
-- them here as well. Then in the plugin connfiguration file you can use the
-- dependencies as needed.
--
-- If you want to lazy load any plugin, load that plugin in it's configuration
-- file. For convention, those files start with the number 42. e.g.
-- 42-which-key.lua
--
-- If any plugins need to have higher priority, prefix their configuration file
-- name with numbers in order of their priority, e.g.
-- 00-plugins.lua     -- this loads first
-- 01-colorscheme.lua -- this loads second
--
-- All other plugins use normal file names
vim.pack.add({
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin'
  },
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-lua/plenary.nvim',
  'http://github.com/nvim-treesitter/nvim-treesitter-context',
  {
    src = 'http://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    version = 'main'
  },
  'http://github.com/nvim-treesitter/nvim-treesitter',
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = vim.version.range('1.x')
  },
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/folke/trouble.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/popup.nvim',
  {
    src = 'https://github.com/ThePrimeagen/harpoon',
    version = 'harpoon2'
  },
  'https://github.com/tpope/vim-fugitive',
})
