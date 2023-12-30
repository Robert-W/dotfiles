return {
  'catppuccin/nvim',
  priority = 1000,
  init = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      integrations = {
        aerial = true,
        lsp_trouble = true,
        mason = true,
        notify = true,
      },
      transparent_background = true
    })

    -- Set the colorscheme
    vim.cmd('colorscheme catppuccin')

    -- Override some UI options, add borders to the following items
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = 'rounded' }
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = 'rounded' }
    )

    vim.diagnostic.config({ float = { border = 'rounded' }})
  end,
}
