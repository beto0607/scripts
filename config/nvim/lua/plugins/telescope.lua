return {

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- stylua: ignore
      {
        "<leader>pf",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files()
        end,
      },
      {
        "<C-p>",
        function()
          local builtin = require("telescope.builtin")
          builtin.git_files({ show_untracked = true })
        end,
      },
      {
        "<leader>ps",
        function()
          local builtin = require("telescope.builtin")
          builtin.grep_string()
        end,
      },
      {
        "<leader>pg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    },
  },
}
