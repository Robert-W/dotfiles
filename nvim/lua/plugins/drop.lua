return {
  'folke/drop.nvim',
  event = 'VimEnter',
  init = function()
    local drop = require('drop')

    drop.setup({
      theme = 'xmas',
      interval = 150,
      screensaver = 1000 * 60 * 3
    })
  end
}
