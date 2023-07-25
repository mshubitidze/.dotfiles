local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "80" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
  {
    name = "eslint",
    filetypes = { "typescript", "typescriptreact" }
  },
  {
    name = "ocamlformat"
  },
  {
    name = "beautysh"
  }
}
