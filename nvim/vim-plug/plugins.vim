" Auto-install vim plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" Intellisense
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	" Telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'kyazdani42/nvim-web-devicons'

	" Theme/Synatx/Formatting
	Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	Plug 'editorconfig/editorconfig-vim'
	Plug 'navarasu/onedark.nvim'

call plug#end()
