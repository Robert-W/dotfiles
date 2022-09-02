local Maps = {}

local function bind(op, outer_ops)
  outer_ops = outer_ops or { noremap = true }
  return function(left, right, opts)
    opts = vim.tbl_extend("force", outer_ops, opts or {})
    vim.keymap.set(op, left, right, opts)
  end
end

Maps.nmap = bind("n", { noremap = false })
Maps.nnoremap = bind("n")
Maps.vnoremap = bind("v")
Maps.xnoremap = bind("x")
Maps.inoremap = bind("i")

return Maps
