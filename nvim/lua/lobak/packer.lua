return require("packer").startup(function(use)

  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Theme/Syntax/Formatting
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("editorconfig/editorconfig-vim")
  use("navarasu/onedark.nvim")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")

  -- Treesitter related plugins
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")

  -- LSP made easy
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'glepnir/lspsaga.nvim'},
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

end)
