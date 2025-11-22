return {
  {
    "jim-at-jibba/micropython.nvim",
    dependencies = { "akinsho/toggleterm.nvim", "stevearc/dressing.nvim" },
    enable = true,
    config = function()
      -- require("micropython_nvim").setup({
      --   -- global_cmd = "ampy", -- set this if ampy is not in your PATH
      -- })
      --
      -- -- Recommended Keybindings
      -- vim.keymap.set("n", "<leader>mr", require("micropython_nvim").run, { desc = "Run on Device" })
      -- vim.keymap.set("n", "<leader>mu", require("micropython_nvim").upload, { desc = "Upload to Device" })
      -- vim.keymap.set("n", "<leader>mi", require("micropython_nvim").init, { desc = "Init MicroPython Project" })
      -- vim.keymap.set("n", "<leader>me", require("micropython_nvim").repl, { desc = "Open REPL" })
    end,
  },
}
