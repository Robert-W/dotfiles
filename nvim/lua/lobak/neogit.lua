local neogit = require("neogit")
local nnoremap = require("lobak.keymap").nnoremap

neogit.setup {}

nnoremap("<leader>gs", function()
  neogit.open({})
end);
