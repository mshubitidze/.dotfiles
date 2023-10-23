local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

lvim.keys.normal_mode["<leader>a"] = mark.add_file
lvim.keys.normal_mode["<M-e>"] = ui.toggle_quick_menu
lvim.keys.normal_mode["<M-h>"] = function()
  ui.nav_file(1)
end
lvim.keys.normal_mode["<M-t>"] = function()
  ui.nav_file(2)
end
lvim.keys.normal_mode["<M-n>"] = function()
  ui.nav_file(3)
end
lvim.keys.normal_mode["<M-s>"] = function()
  ui.nav_file(4)
end
