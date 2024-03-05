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
    vim.keymap.set('n', '<leader>tc', '<cmd>CloakToggle<CR>', { desc = '[T]oggle [C]loak' })
  end
}
