-- Colors to use for various indentation levels
vim.cmd [[highlight IndentLevel1 guifg=#F9D791 gui=nocombine]] -- yellow
vim.cmd [[highlight IndentLevel2 guifg=#D27E99 gui=nocombine]] -- red
vim.cmd [[highlight IndentLevel3 guifg=#A3D4D5 gui=nocombine]] -- cyan
vim.cmd [[highlight IndentLevel4 guifg=#D9A594 gui=nocombine]] -- rose
vim.cmd [[highlight IndentLevel5 guifg=#6A9589 gui=nocombine]] -- green
vim.cmd [[highlight IndentLevel6 guifg=#766B90 gui=nocombine]] -- purple

require('indent_blankline').setup({
  show_end_of_line = true,
  show_current_context = true,
  space_char_blankline = ' ',
  char_highlight_list = {
    'IndentLevel1',
    'IndentLevel2',
    'IndentLevel3',
    'IndentLevel4',
    'IndentLevel5',
    'IndentLevel6',
  }
})
