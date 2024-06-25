-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>pv", "<cmd>Oil --float<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n","<C-d>","<C-d>zz")
-- vim.keymap.set("n","<C-u>","<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zt")
vim.keymap.set("n", "<C-u>", "<C-u>zt")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n","<leader>k","<cmd>cnext<CR>zz")
-- vim.keymap.set("n","<leader>j","<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set("n", "<leader><CR>", "i<CR><Esc>")

vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>hs", "<cmd>split<CR>")

vim.keymap.set("n", "<leader>1", "1<C-w><C-w>")
vim.keymap.set("n", "<leader>2", "2<C-w><C-w>")
vim.keymap.set("n", "<leader>3", "3<C-w><C-w>")
vim.keymap.set("n", "<leader>4", "4<C-w><C-w>")
vim.keymap.set("n", "<leader>5", "5<C-w><C-w>")
vim.keymap.set("n", "<leader>6", "6<C-w><C-w>")
vim.keymap.set("n", "<leader>7", "7<C-w><C-w>")
vim.keymap.set("n", "<leader>8", "8<C-w><C-w>")
vim.keymap.set("n", "<leader>9", "9<C-w><C-w>")

vim.keymap.set("n", "<leader>,", "$A,<Esc>")
vim.keymap.set("n", "<leader>;", "$A;<Esc>")

vim.keymap.set("n", "<leader>nv", "<cmd>Navbuddy<cr>")

vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
