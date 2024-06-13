-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use('stevearc/oil.nvim')
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({ 'catppuccin/nvim', as = 'catppuccin' })

    use('christoomey/vim-tmux-navigator')
    use { 'windwp/nvim-ts-autotag', }
    use({
        'nvim-treesitter/nvim-treesitter',
        dependencies= { { 'windwp/nvim-autopairs' } },
        run = ':TSUpdate',
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            require('nvim-ts-autotag').setup({
                enable = true,
                filetypes = { "html", "xml", "tsx" },
            })
            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                -- enable indentation
                indent = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = false,
                },
                -- autotag = {
                --     enable = true,
                -- },
                autopairs = {
                    enable = true,
                },

                -- ensure these language parsers are installed
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "lua",
                    "vim",
                    "tsx",
                    "yaml",
                    "json",
                    "html",
                    "css",
                    "scss",
                    "python"
                },
            })
        end
    }
    )
    use('nvim-treesitter/playground')


    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lukas-reineke/indent-blankline.nvim')
    use('nvim-tree/nvim-web-devicons')
    use('nvim-lualine/lualine.nvim')

    use({
        'williamboman/mason.nvim',
        run = ':MasonUpdate'
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    -- install without yarn or npm
    use { 'iamcco/markdown-preview.nvim' }
    --Auto pairs
    use {
        'windwp/nvim-autopairs',
        wants = 'nvim-treesitter',
        module = { 'nvim-autopairs.completion.cmp', 'nvim-autopairs' },
        config = function()
            require('nvim-autopairs').setup {
                check_ts = true,
            }
        end
    }
    use('f-person/git-blame.nvim')
    use('dart-lang/dart-vim-plugin')

    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    })
end)
