require('lobak.set')
require('lobak.remap')
require('lobak.lazy')

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local TrimWhitespaceGroup = augroup('TrimWhitespace', {})
local TextFormatGroup = augroup("TextFormat", { clear = true })

-- Trim whitespace when saving files
autocmd({ "BufWritePre" }, {
  group = TrimWhitespaceGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Allow code to exceed vim.opt.textwidth
autocmd({ "BufWinEnter" }, {
  group = TextFormatGroup,
  buffer = 0,
  command = "set formatoptions-=t"
})
