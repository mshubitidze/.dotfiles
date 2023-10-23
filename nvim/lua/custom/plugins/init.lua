return {
  { 'christoomey/vim-tmux-navigator' },

  {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    config = function()
      require('nvim-surround').setup()
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },

  {
    "EdenEast/nightfox.nvim",
  },

}
