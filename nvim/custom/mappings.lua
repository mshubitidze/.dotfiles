---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- override the default window navigation with vim-tmux-navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },

    -- because i have braindamage
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- better scrolling
    ["<C-d>"] = { "<C-d>zz", "jump down and center cursor", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "jump up and center cursor", opts = { nowait = true } },

    -- better searching
    ["n"] = { "nzzzv", "center cursor on next search item", opts = { nowait = true } },
    ["N"] = { "Nzzzv", "center cursor on previous search item", opts = { nowait = true } },

    -- moving a line under cursor in normal mode
    ["<M-k>"] = { "<S-v>:m '<-2<CR>gv=", "move line up", opts = { nowait = true } },
    ["<M-j>"] = { "<S-v>:m '>+1<CR>gv=", "move line down", opts = { nowait = true } },
  },
  v = {
    -- moving a single line or multiple lines in visual mode
    ["<M-k>"] = { ":m '<-2<CR>gv=gv", "move line up", opts = { nowait = true } },
    ["<M-j>"] = { ":m '>+1<CR>gv=gv", "move line down", opts = { nowait = true } },
  },
}

return M
