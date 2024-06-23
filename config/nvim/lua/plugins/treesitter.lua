return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "angular",
        "tsx",
        "typescript",
      })
      vim.filetype.add({
        pattern = {
          [".*%.component%.html"] = "angular.html", -- Sets the filetype to `angular.html` if it matches the pattern
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "angular.html",
        callback = function()
          print("potatos")
          vim.treesitter.language.register("angular", "angular.html") -- Register the filetype with treesitter for the `angular` language/parser
        end,
      })
    end,
  },
}
