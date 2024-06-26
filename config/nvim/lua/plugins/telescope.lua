return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
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
          builtin.grep_string({ reuse_win = true })
        end,
      },
      {
        "<leader>pg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({ reuse_win = true })
        end,
      },
      {
        "<leader>gs",
        "<cmd>:top Git<CR>",
      },
      {
        "<leader>,",
        "$A,<Esc>",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        keymaps = {
          ["n"] = {},
        },
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
