return {
  "tpope/vim-fugitive",
  event = "BufWinEnter",
  config = function()
    vim.keymap.set("n", "<leader>gs", ":top Git<CR>")

    local betoio_fugitive = vim.api.nvim_create_augroup("betoio_Fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd

    autocmd("BufWinEnter", {
      group = betoio_fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        vim.keymap.set("n", "<leader>gps", function()
          if vim.api.nvim_buf_get_name(0):find("^fugitive") ~= nil then
            vim.cmd.Git("push")
          end
        end)
        vim.keymap.set("n", "<leader>gpsu", function()
          if vim.api.nvim_buf_get_name(0):find("^fugitive") ~= nil then
            vim.cmd.Git("psu")
          end
        end)

        vim.keymap.set("n", "<leader>gpl", function()
          if vim.api.nvim_buf_get_name(0):find("^fugitive") ~= nil then
            vim.cmd.Git("pull")
          end
        end)
      end,
    })
  end,
}
