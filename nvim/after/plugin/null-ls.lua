local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- Eslint Settings, may change this out for prettier
    formatting.eslint,
    code_actions.eslint,
    diagnostics.eslint.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    diagnostics.tsc.with({
      prefer_local = 'node_modules/.bin'
    })
  }
})
