local neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-go'),
    require('neotest-jest'),
    require('neotest-plenary'),
  },
  quickfix = {
    enabled = false
  },
  watch = {
    enabled = true
  }
})

local run_file = (function () neotest.run.run(vim.fn.expand("%")) end)
local run_test = (function () neotest.run.run() end)

vim.keymap.set('n', ';ts', neotest.summary.toggle)
vim.keymap.set('n', ';tf', run_file)
vim.keymap.set('n', ';tt', run_test)
