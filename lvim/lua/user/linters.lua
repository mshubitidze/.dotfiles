local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  -- {
  --   name = "shellcheck",
  --   args = { "--severity", "warning" },
  -- },
}
