vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>gS", function()
    if vim.api.nvim_buf_get_name(0):find('^fugitive') ~= nil then
        vim.cmd.Git('status')
    end
end)

vim.keymap.set("n", "<leader>gps", function()
    if vim.api.nvim_buf_get_name(0):find('^fugitive') ~= nil then
        vim.cmd.Git('push')
    end
end)

vim.keymap.set("n", "<leader>gpsu", function()
    if vim.api.nvim_buf_get_name(0):find('^fugitive') ~= nil then
        vim.cmd.Git('psu')
    end
end)

vim.keymap.set("n", "<leader>gpl", function()
    if vim.api.nvim_buf_get_name(0):find('^fugitive') ~= nil then
        vim.cmd.Git('pull')
    end
end)
