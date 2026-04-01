-- Override these for terraform otherwise the LSP wont detect them
vim.filetype.add({
  extension = {
    tf = 'terraform',
    tfvars = 'terraform-vars',
    tfstate = 'terraform',
    tofu = 'opentofu',
  }
})

