-- There is some strangeness around detecting filetypes, use this to enforce it
vim.filetype.add({
  extension = {
    tf = 'opentofu',
    tofu = 'opentofu',
  }
})

return {
  cmd = { 'tofu-ls', 'serve' },
  filetypes = { 'terraform', 'terraform-vars', 'tf', 'opentofu', 'opentofu-vars' },
  root_markers = { '.terraform', '.git' },
}
