vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = "*",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules"
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      window = {
        width = 40
      }
    }
  end,
}
