local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local TrimWhitespaceGroup = augroup('TrimWhitespace', {})
local TextFormatGroup = augroup('TextFormat', { clear = true })
local TextYankGroup = augroup('TextYank', { clear = true })
local FoldingGroup = augroup('CodeFold', { clear = true })

-- Trim whitespace when saving files
autocmd({ 'BufWritePre' }, {
  group = TrimWhitespaceGroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Allow code to exceed vim.opt.textwidth
autocmd({ 'BufWinEnter' }, {
  group = TextFormatGroup,
  buffer = 0,
  command = 'set formatoptions-=t'
})

-- Allow code to exceed vim.opt.textwidth
autocmd({ 'BufWinEnter' }, {
  group = FoldingGroup,
  callback = function ()
    vim.cmd('normal zR')
  end
})

-- Highlight text that is being yanked
autocmd({ 'TextYankPost' }, {
  group = TextYankGroup,
  callback = function ()
    vim.highlight.on_yank()
  end
})
