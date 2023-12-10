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
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
  },

  {
    'EdenEast/nightfox.nvim',
  },

  {
    'projekt0n/github-nvim-theme',
  },

  {
    'sindrets/diffview.nvim',
  },

  {
    'folke/trouble.nvim',
  },
}
