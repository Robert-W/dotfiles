return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- This requires plenary down below
  use("TimUntersberger/neogit")

  -- Treesitter related plugins
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")

  -- Important Things
  use("williamboman/mason-lspconfig.nvim")
  use('jose-elias-alvarez/null-ls.nvim')
  use("williamboman/mason.nvim")
  use("neovim/nvim-lspconfig")
  use("glepnir/lspsaga.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/nvim-cmp")
  use("L3MON4D3/LuaSnip")

  -- Autotag and Autopair
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- Theme/Syntax/Formatting
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("editorconfig/editorconfig-vim")
  use("navarasu/onedark.nvim")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")

end)
