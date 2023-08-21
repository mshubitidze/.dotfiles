local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    args = { "--print-width", "80" },
    filetypes = { "typescript", "typescriptreact" },
  },
  -- { name = "black" },
  -- {
  --   name = "eslint",
  --   filetypes = { "typescript", "typescriptreact" }
  -- },
  -- {
  --   name = "ocamlformat"
  -- },
  -- {
  --   name = "beautysh"
  -- }
}
