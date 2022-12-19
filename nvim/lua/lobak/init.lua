require('lobak.set')
require('lobak.remap')
require('lobak.packer')

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local LobakGroup = augroup('Lobak', {})
local TextFormatGroup = augroup("TextFormat", { clear = true })

autocmd({"BufWritePre"}, {
	group = LobakGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Allow code to exceed vim.opt.textwidth
autocmd({"BufWinEnter"}, {
  group = TextFormatGroup,
  buffer = 0,
  command = "set formatoptions-=t"
})

vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
