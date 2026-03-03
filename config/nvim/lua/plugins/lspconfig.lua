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
