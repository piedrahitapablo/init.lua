local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- very important, this needs to be set before the plugins are required
vim.g.mapleader = " "

local status, lazy = pcall(require, "lazy")
if not status then
    print("Lazy is not installed")
    return
end

lazy.setup({
    -- colorschemes
    {
        "jaredgorski/spacecamp",
        name = "spacecamp",
    },
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    {
        "Shatur/neovim-ayu",
        name = "ayu"
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },
    "navarasu/onedark.nvim",

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            { "nvim-lua/plenary.nvim" }
        }
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        }
    },
    {
        "utilyre/barbecue.nvim",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },

    -- nvim-tree
    { "tpope/vim-vinegar" },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
    },

    -- auto save sessions
    { "rmagatti/auto-session" },

    -- treesitter
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-context",

    -- lsp and diagnostics
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },             -- Required
            { "williamboman/mason.nvim" },           -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },         -- Required
            { "hrsh7th/cmp-nvim-lsp" },     -- Required
            { "hrsh7th/cmp-buffer" },       -- Optional
            { "hrsh7th/cmp-path" },         -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" },     -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },             -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "MunifTanjim/prettier.nvim" },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- copilot
    -- "github/copilot.vim",

    -- tabnine
    {
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh"
    },

    { "mbbill/undotree" },

    -- git
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },

    { "lukas-reineke/indent-blankline.nvim" },

    -- code edition
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    "tpope/vim-commentary",
    "tpope/vim-surround",

    -- previews
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
})