local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local TrimWhitespaceGroup = augroup('TrimWhitespace', {})
local TextFormatGroup = augroup('TextFormat', { clear = true })
local TextYankGroup = augroup('TextYank', { clear = true })

-- Trim whitespace and trailing blank lines when saving files
autocmd({ 'BufWritePre' }, {
  group = TrimWhitespaceGroup,
  pattern = '*',
  callback = function (args)
    local CurrentView = vim.fn.winsaveview()
    -- Trim trailing whitespace first
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    -- Get the line number of the last line with content
    local LastLine = vim.fn.prevnonblank(vim.fn.line('$'))
    -- Then wipe out any lines after that
    vim.api.nvim_buf_set_lines(args.buf, LastLine, -1, false, {})
    vim.fn.winrestview(CurrentView)
  end,
})

-- Allow code to exceed vim.opt.textwidth
autocmd({ 'BufWinEnter' }, {
  group = TextFormatGroup,
  buffer = 0,
  command = 'set formatoptions-=t'
})

-- Highlight text that is being yanked
autocmd({ 'TextYankPost' }, {
  group = TextYankGroup,
  callback = function ()
    vim.highlight.on_yank()
  end
})
