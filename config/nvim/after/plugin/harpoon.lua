local mark = require("harpoon.mark")

local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>k", function() ui.nav_prev() end)
vim.keymap.set("n", "<leader>j", function() ui.nav_next() end)
