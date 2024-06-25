return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      return {
        icons_enabled = true,
        theme = "catppuccin",
      }
    end,
  },
}
