local util = require "lspconfig/util"

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>td", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
        vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
        vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>D", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set("n", "<leader>o", function()
            vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
        end)

        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)

        vim.keymap.set("n", "gl", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

local function organize_imports()
    local params = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = '',
    }
    vim.lsp.buf.execute_command(params)
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'eslint',
        'lua_ls',
        'gopls',
        "angularls",
        "htmx",
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        tsserver = function()
            require('lspconfig').tsserver.setup({
                single_file_support = false,
                commands = {
                    OrganizeImports = {
                        organize_imports,
                        description = 'Organize Imports'
                    }
                },
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>O", function() vim.cmd.OrganizeImports() end, opts)
                end
            })
        end,
        gopls = function()
            require('lspconfig').tsserver.setup({
                on_attach = function()
                end,
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),

                settings = {
                    gopls = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        analyses = {
                            unusedparams = true
                        }
                    }
                }
            })
        end,
    }
})


-- local lsp = require("lsp-zero")
--
--
--         -- lsp.configure('html', {
--         --     on_attach = on_attach,
--         --     capabilities = capabilities,
--         --     cmd = { "html-languageserver", "--stdio" },
--         -- })
--         --
--         -- lsp.configure('cssls', {
--         --     on_attach = on_attach,
--         --     capabilities = capabilities,
--         --     cmd = { "css-languageserver", "--stdio" },
--         -- })
--         --
--         lsp.configure('gopls', {
--             on_attach = function()
--                 lsp.on_attach()
--                 vim.keymap.set("n", "<leader>gbp", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
--                 vim.keymap.set("n", "<leader>gdu", function()
--                     local widgets = require("dap.ui.widgets")
--                     local sidebar = widgets.sidebar(widgets.scopes)
--                     sidebar.open()
--                 end)
--
--                 vim.keymap.set("n", "<leader>gdt", function()
--                     require("dap-go").debug_test()
--                 end)
--                 vim.keymap.set("n", "<leader>gdl", function()
--                     require("dap-go").debug_last()
--                 end)
--                 vim.keymap.set("n", "<leader>gtj", "<cmd> GoTagAdd json <CR>")
--                 vim.keymap.set("n", "<leader>gtb", "<cmd> GoTagAdd bson <CR>")
--             end,
--             capabilities = capabilities,
--             cmd = { "gopls" },
--             filetypes = { "go", "gomod", "gowork", "gotmpl" },
--             root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--
--             settings = {
--                 gopls = {
--                     usePlaceholders = true,
--                     completeUnimported = true,
--                     analyses = {
--                         unusedparams = true
--                     }
--                 }
--             }
--
--         })
--
--         lsp.setup_servers({ 'dartls', force = true })
--
--         lsp.configure('tsserver', {
--             on_attach = function()
--                 lsp.on_attach()
--                 vim.keymap.set("n", "<leader>O", function() vim.cmd.OrganizeImports() end, opts)
--             end,
--             capabilities = capabilities,
--             commands = {
--                 OrganizeImports = {
--                     organize_imports,
--                     description = 'Organize Imports'
--                 }
--             }
--         })
--
--         local cmp = require("cmp")
--         local cmp_select = { behavior = cmp.SelectBehavior.Select }
--         local cmp_mappings = lsp.defaults.cmp_mappings({
--             ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--             ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--             ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--             ['<C-Space>'] = cmp.mapping.complete(),
--         })
--
--         lsp.set_preferences({
--             sign_icons = {},
--         })
--
--         lsp.setup_nvim_cmp({
--             mapping = cmp_mappings
--         })
--
--
--         lsp.on_attach(function(client, bufnr)
--             local opts = { buffer = bufnr, remap = false }
--
--             vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--             vim.keymap.set("n", "<leader>td", function() vim.lsp.buf.type_definition() end, opts)
--             vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
--             vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
--             vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--             vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
--             vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
--             vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
--             vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--             vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--             vim.keymap.set("n", "<leader>d", function() vim.diagnostic.goto_next() end, opts)
--             vim.keymap.set("n", "<leader>D", function() vim.diagnostic.goto_prev() end, opts)
--
--             vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--             vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--             vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--             vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--
--             vim.keymap.set("n", "<leader>o", function()
--                 vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
--             end)
--
--             vim.keymap.set('n', '<leader>f', function()
--                 vim.lsp.buf.format { async = true }
--             end, opts)
--         end)
--         lsp.setup()
