local function gonnaSlowMeDown(_, bufnr)
  return vim.api.nvim_buf_line_count(bufnr) > 1000
end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "help",
    "rust",
    "javascript",
    "typescript",
    "markdown",
    "markdown_inline",
    "jsdoc",
    "css",
    "html",
    "json",
    "yaml",
    "lua",
  },
  sync_install = false,
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(lang, bufnr)
      return gonnaSlowMeDown(lang, bufnr)
    end,
  }
})