return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_)
      vim.filetype.add({
        pattern = {
          [".*%.component%.html"] = "angular.html", -- Sets the filetype to `angular.html` if it matches the pattern
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "angular.html",
        callback = function()
          vim.treesitter.language.register("angular", "angular.html") -- Register the filetype with treesitter for the `angular` language/parser
        end,
      })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
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
        },

        sync_install = false,

        auto_install = true,

        indent = {
          enable = true,
        },

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = { "markdown" },
        },
      })

      local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      treesitter_parser_config.templ = {
        install_info = {
          url = "https://github.com/vrischmann/tree-sitter-templ.git",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "master",
        },
      }

      vim.treesitter.language.register("templ", "templ")
    end,
  },
}
