return {
  'laytan/cloak.nvim',
  config = function()
    require('cloak').setup({
      enabled = false,
      patterns = {
        { file_pattern = '.env*', cloak_pattern = '=.+' }
      },
    })

    -- Setup shortcut to toggle cloak on and off
    vim.keymap.set('n', '<leader>sh', '<cmd>CloakToggle<CR>', { desc = 'Toggle secret values with Cloak' })

  end
}
