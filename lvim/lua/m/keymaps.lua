-- center cursor on find/scroll
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- ctrl + hjkl pane navigation
-- both in tmux and nvim with christoomey/vim-tmux-navigator
lvim.keys.normal_mode["C-h"] = ":<C-U>TmuxNavigateLeft<cr>"
lvim.keys.normal_mode["C-j"] = ":<C-U>TmuxNavigateDown<cr>"
lvim.keys.normal_mode["C-k"] = ":<C-U>TmuxNavigateUp<cr>"
lvim.keys.normal_mode["C-l"] = ":<C-U>TmuxNavigateRight<cr>"
