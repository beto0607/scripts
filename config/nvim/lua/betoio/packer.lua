-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use("stevearc/oil.nvim")
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.6' }

    use { "catppuccin/nvim", as = "catppuccin" }

    use('christoomey/vim-tmux-navigator')


    use('nvim-treesitter/nvim-treesitter', {
        run = ':TSUpdate',
        event = { "BufReadPre", "BufNewFile" },
    })
    use('nvim-treesitter/playground')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('lukas-reineke/indent-blankline.nvim')
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use('nvim-tree/nvim-web-devicons')
    use('nvim-lualine/lualine.nvim')

    use({
        "williamboman/mason.nvim",
        run = ":MasonUpdate",
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- install without yarn or npm
    use { 'iamcco/markdown-preview.nvim' }
    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        wants = "nvim-treesitter",
        module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
        config = function()
            require("nvim-autopairs").setup {
                check_ts = true,
            }
        end
    }
    -- Auto tag
    use {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup({
                enabled = true,
                opts = {
                    -- Defaults
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = false -- Auto close on trailing </
                },
            })
        end,
    }
    use('f-person/git-blame.nvim')

    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    use {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end
    }
    use("mfussenegger/nvim-dap")
    use {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end
    }
    use("HiPhish/rainbow-delimiters.nvim")
end)
