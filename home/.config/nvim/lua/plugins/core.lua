-- Theme family is persistent state written by the `theme` command. Appearance
-- comes from Neovim's `background`; auto-dark-mode keeps long-running sessions
-- synchronized with macOS.
local uv = vim.uv or vim.loop
local family_file = vim.fn.expand("~/.config/theme/family")
local families = { ["rose-pine"] = true, catppuccin = true }

local function family()
  local fd = io.open(family_file, "r")
  if fd then
    local value = vim.trim(fd:read("*l") or "")
    fd:close()
    if families[value] then
      return value
    end
  end
  return "rose-pine"
end

local function family_is_active(value)
  local colorscheme = vim.g.colors_name or ""
  if value == "catppuccin" then
    return vim.startswith(colorscheme, "catppuccin")
  end
  return colorscheme == value
end

local function apply_family()
  local value = family()
  if not family_is_active(value) then
    vim.cmd.colorscheme(value)
  end
end

-- A timer is more reliable than a filesystem watcher when the state file is
-- atomically replaced. It is closed explicitly so it cannot delay shutdown.
local family_timer = uv.new_timer()
local function watch_family()
  if family_timer then
    family_timer:start(2000, 2000, vim.schedule_wrap(apply_family))
    vim.api.nvim_create_autocmd("VimLeavePre", {
      once = true,
      callback = function()
        if family_timer and not family_timer:is_closing() then
          family_timer:stop()
          family_timer:close()
        end
      end,
    })
  end
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Snacks natively generates a lazygit theme from the active colorscheme,
      -- refreshes it on ColorScheme, and configures nvim-remote editing.
      lazygit = { configure = true },
      picker = { sources = { explorer = { hidden = true, ignored = true } } },
    },
  },
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
        vim.o.background = "dark"
      end,
      set_light_mode = function()
        vim.o.background = "light"
      end,
    },
    config = function(_, opts)
      require("auto-dark-mode").setup(opts)
      watch_family()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.cmd.colorscheme(family())
      end,
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = nil
    end,
  },
}
