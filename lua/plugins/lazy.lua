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

plugins = {
    
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = 
        {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        },
    },

    {
        'nvim-telescope/telescope.nvim', --tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        "github/copilot.vim"
    },

    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    {
        "RRethy/vim-illuminate"
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    {'neovim/nvim-lspconfig' },

    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },


    -- Debugging
    {'nvim-lua/plenary.nvim' },
    { 'mfussenegger/nvim-dap' },

    { "folke/neodev.nvim", opts = {} },
    { "nvim-neotest/nvim-nio" },
    { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },


    {'akinsho/toggleterm.nvim', version = "*", config = true},
    
    { 
        "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} 
    },

    {
        'Mofiqul/dracula.nvim',
    },

    {
        'numToStr/Comment.nvim',
    },

    {
        "fladson/vim-kitty"
    },

    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
    {
        'tpope/vim-sleuth',
    },
    {
        "mfussenegger/nvim-jdtls"
    },
    {
        'christoomey/vim-tmux-navigator'
    },
    {
        'coddingtonbear/neomake-platformio',
    },
}

opts = {}

require("lazy").setup(plugins, opts)
