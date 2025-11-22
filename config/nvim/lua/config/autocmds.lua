-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Autocmds are automatically loaded on the VeryLazy event
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local betoioGroup = augroup("betoio", {})

local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
  group = betoioGroup,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "gi", function()
      vim.lsp.buf.implementation()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "<leader>vca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
    -- vim.keymap.set("n", "<leader>d", function()
    --   vim.diagnostic.goto_next()
    -- end, opts)
    -- vim.keymap.set("n", "<leader>D", function()
    --   vim.diagnostic.goto_prev()
    -- end, opts)
    vim.keymap.set("n", "<leader>o", function()
      vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    end)
    vim.keymap.set("n", "<leader>p", function()
      vim.lsp.buf.code_action({ context = { only = { "source.addMissingImports.ts" } }, apply = true })
    end)

    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})
-- vim.filetype.add({
--   pattern = {
--     [".*%.component%.html"] = "angular.html", -- Sets the filetype to `angular.html` if it matches the pattern
--   },
-- })

-- autocmd("FileType", {
--   pattern = "angular.html",
--   callback = function()
--     vim.treesitter.language.register("angular", "angular.html") -- Register the filetype with treesitter for the `angular` language/parser
--   end,
-- })
