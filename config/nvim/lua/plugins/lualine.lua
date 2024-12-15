return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      return {
        icons_enabled = true,
        theme = "catppuccin",
        sections = {
          lualine_a = {
            "mode",
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
            },
          },
          lualine_b = {
            {
              require("micropython_nvim").statusline,
              cond = package.loaded["micropython_nvim"] and require("micropython_nvim").exists,
            },
          },
        },
      }
    end,
  },
}
