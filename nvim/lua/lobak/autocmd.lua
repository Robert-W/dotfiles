local augroup_textformat = vim.api.nvim_create_augroup("TextFormat", { clear = true })

-- Allow code to pass textwidth length, currently 80
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup_textformat,
  buffer = 0,
  command = "set formatoptions-=t"
})
