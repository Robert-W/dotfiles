local nnoremap = require("lobak.keymap").nnoremap
local builtin = require("telescope.builtin")
local telescope = require("telescope")

nnoremap(";b", function()
  telescope.extensions.file_browser.file_browser()
end)

nnoremap(";f", function()
  builtin.find_files()
end)

nnoremap(";d", function ()
  builtin.diagnostics()
end)

nnoremap(";r", function()
  builtin.live_grep()
end)

nnoremap("\\", function()
  builtin.buffers()
end)

nnoremap(";;", function()
  builtin.help_tags()
end)
