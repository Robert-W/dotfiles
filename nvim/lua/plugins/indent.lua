return {
  'echasnovski/mini.indentscope',
  version = false,
  config = function()
    local MiniIndentscope = require('mini.indentscope')

    MiniIndentscope.setup({
      draw = {
        animation = MiniIndentscope.gen_animation.quadratic()
      }
    })
  end
}
