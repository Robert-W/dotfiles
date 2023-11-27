return {
  'folke/drop.nvim',
  event = 'VimEnter',
  init = function()
    local drop = require('drop')

    drop.setup({
      interval = 150,
      max = 40,
      screensaver = 1000 * 60 * 3,
      theme = 'xmas',
    })
  end
}
