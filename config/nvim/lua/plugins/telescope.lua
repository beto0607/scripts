return {
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
    -- {
    --   "<leader>gs",
    --   "<cmd>:top Git<CR>",
    -- },
  },
}
