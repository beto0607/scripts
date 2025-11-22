-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up

vim.keymap.set("n", "J", "mzJ`z") -- append next line

vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste without updating register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- copy without updating register
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- copy without updating register

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- tmux-sessionizer

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- find and replace

vim.keymap.set("n", "<leader><CR>", "i<CR><Esc>") -- new line

vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>") -- split vertically
vim.keymap.set("n", "<leader>hs", "<cmd>split<CR>") -- split horizontally

-- mo to buffer
vim.keymap.set("n", "<leader>1", "1<C-w><C-w>")
vim.keymap.set("n", "<leader>2", "2<C-w><C-w>")
vim.keymap.set("n", "<leader>3", "3<C-w><C-w>")
vim.keymap.set("n", "<leader>4", "4<C-w><C-w>")
vim.keymap.set("n", "<leader>5", "5<C-w><C-w>")
vim.keymap.set("n", "<leader>6", "6<C-w><C-w>")
vim.keymap.set("n", "<leader>7", "7<C-w><C-w>")
vim.keymap.set("n", "<leader>8", "8<C-w><C-w>")
vim.keymap.set("n", "<leader>9", "9<C-w><C-w>")

vim.keymap.set("n", "<leader>,", "$A,<Esc>") -- add comma at the end of line
vim.keymap.set("n", "<leader>;", "$A;<Esc>") -- add semicolon at the end of line

vim.keymap.set("n", "<leader>gs", "<cmd>:top Git<CR>") -- open git status
