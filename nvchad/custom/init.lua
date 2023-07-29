local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

local o = vim.o

o.cc = "80"
o.rnu = true
o.cuc = true
o.cul = true
o.so = 5
o.siso = 5

