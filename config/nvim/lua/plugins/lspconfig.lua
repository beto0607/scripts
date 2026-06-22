return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Configure gopls for templates
      gopls = {
        settings = {
          gopls = {
            templateExtensions = { "gohtml", "tmpl" },
          },
        },
      },
      clangd = {
        keys = {
          { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("platformio.ini", "compile_commands.json", ".git")(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--compile-commands-dir=.", -- This is the magic line
        },
      },
      -- Enable HTML LSP for template files
      html = {
        filetypes = {
          "javascript",
          "gohtml",
          "gotmpl",
          "html",
        },
      },
    },
  },
}
