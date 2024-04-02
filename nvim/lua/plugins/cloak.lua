return {
  'laytan/cloak.nvim',
  config = function()
    require('cloak').setup({
      enabled = true,
      patterns = {
        {
          file_pattern = {
            '.env*',
            '*.env'
          },
          cloak_pattern = '=.+'
        },
        {
          file_pattern = {
            'configuration.json',
            'environment.json',
            'bubble_environment.json',
            'local_bootstrap.json'
          },
          cloak_pattern = ':.+'
        }
      },
    })

    -- Setup shortcut to toggle cloak on and off
    vim.keymap.set('n', '<leader>tc', '<cmd>CloakToggle<CR>', { desc = '[T]oggle [C]loak' })
  end
}
