-- find better name for this file

return {
    -- LSP
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = {
                    "rust_analyzer",
                }
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },

    -- autocompletions (for now)
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required


    { -- TODO: add a vsplit and hsplit option for these (might be in keymaps)
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", "python", "rust" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,


            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    },

    
    -- Debugging
    {'nvim-lua/plenary.nvim' },
    { 'mfussenegger/nvim-dap' },

    {
        "folke/neodev.nvim",
        opts = {
            library = { 
                plugins = { "nvim-dap-ui" },
                types = true,
            },
        },
    },

    { "nvim-neotest/nvim-nio" },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            -- Optional: auto-open UI when DAP starts/stops (GPT not sure if this works check TODO)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Custom global toggle (optional)
            function ToggleDapUI()
                dapui.toggle()
            end

            -- Keybindings
            vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
        end,
    },

}
