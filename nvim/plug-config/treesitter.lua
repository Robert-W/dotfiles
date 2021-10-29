require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"rust",
		"javascript",
		"typescript",
		"css",
		"html",
		"json",
		"scss",
		"yaml"
	}
})
