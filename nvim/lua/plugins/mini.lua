--- Collection of nvim plugins from mini
return {
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
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
}
