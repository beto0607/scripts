return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "|" },
    },
    config = function(_, opts)
      vim.opt.list = true
      vim.opt.listchars:append("eol:↴")
      require("ibl").setup(opts)
    end,
  },
}
