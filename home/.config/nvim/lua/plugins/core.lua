-- Family from $THEME_FAMILY; light/dark from macOS via auto-dark-mode
-- (polls directly — OSC 11 bg detection doesn't survive herdr/tmux).
local function family()
  return vim.env.THEME_FAMILY == "catppuccin" and "catppuccin" or "rose-pine"
end

local function apply(bg)
  vim.o.background = bg
  pcall(vim.cmd.colorscheme, family())
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
  -- { "christoomey/vim-tmux-navigator", enabled = false },

  { "rose-pine/neovim", name = "rose-pine", opts = { variant = "auto", dark_variant = "main" } },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = { flavour = "auto", background = { light = "latte", dark = "macchiato" } },
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 3000,
      set_dark_mode = function()
        apply("dark")
      end,
      set_light_mode = function()
        apply("light")
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = family },
  },
}
