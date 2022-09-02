local Remap = require("lobak.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local saga = require("lspsaga")

saga.init_lsp_saga()

nnoremap("gk", "<Cmd>Lspsaga hover_doc<CR>")
nnoremap("gp", "<Cmd>Lspsaga preview_definition<CR>")
inoremap("<C-h>", "<Cmd>Lspsaga signature_help<CR>")
nnoremap("<leader>ca", "<Cmd>Lspsaga code_action<CR>")
nnoremap("<leader>e", "<Cmd>Lspsaga show_line_diagnostics<CR>")
