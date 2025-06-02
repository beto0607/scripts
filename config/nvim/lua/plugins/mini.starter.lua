return {
  {
    "echasnovski/mini.starter",
    enabled = true,
    opts = function()
      if vim.fn.expand("%:p") == "" then
        vim.defer_fn(function()
          require("oil").open(".")
        end, 0)
      end
    end,
  },
}
