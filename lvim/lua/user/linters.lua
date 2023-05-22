local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  -- {
  --   name = "eslint",
  --   filetypes = { "typescript", "typescriptreact" }
  -- }
  -- {
  --   name = "shellcheck",
  --   args = { "--severity", "warning" },
  -- },
}
