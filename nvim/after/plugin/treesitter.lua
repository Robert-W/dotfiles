local function gonnaSlowMeDown(_, bufnr)
  return vim.api.nvim_buf_line_count(bufnr) > 1000
end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "rust",
    "javascript",
    "typescript",
    "jsdoc",
    "css",
    "html",
    "json",
    "yaml",
    "lua",
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  highlight = {
    enable = true,
    disable = function(lang, bufnr)
      return gonnaSlowMeDown(lang, bufnr)
    end,
    additional_vim_regex_highlighting = false,
  }
})
