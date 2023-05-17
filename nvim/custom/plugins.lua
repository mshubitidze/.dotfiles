local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    event = "BufRead",
    cmd = "TroubleToggle",
  },

  {
    "kylechui/nvim-surround",
    event = "CursorMoved",
    version = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- -- Remove the `use` here if you're using folke/lazy.nvim.
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "CursorMoved",
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<c-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true })
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
