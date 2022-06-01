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
    "jsdoc",
    "css",
    "html",
    "json",
    "scss",
    "yaml"
  }
})
