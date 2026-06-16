-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function herdr_nav(dir, wincmd)
  local from = vim.api.nvim_get_current_win()
  vim.cmd.wincmd(wincmd)
  if from == vim.api.nvim_get_current_win() then
    vim.system({ "herdr", "pane", "focus", "--direction", dir, "--current" })
  end
end

for _, m in ipairs({
  { "<C-h>", "h", "left" },
  { "<C-j>", "j", "down" },
  { "<C-k>", "k", "up" },
  { "<C-l>", "l", "right" },
}) do
  vim.keymap.set("n", m[1], function()
    herdr_nav(m[3], m[2])
  end, { desc = "Navigate panes: " .. m[3] })
end
