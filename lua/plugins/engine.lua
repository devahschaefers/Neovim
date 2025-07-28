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
    {
        "saghen/blink.cmp",
        version = "1.*", -- stable, pre-built binary
        dependencies = {
            "L3MON4D3/LuaSnip",            -- snippet engine
            "rafamadriz/friendly-snippets" -- large collection of ready-to-use snippets
        },
        opts = {
            -- Custom keymap: Enter to accept, Up/Down to select, C-Space to trigger, C-f/C-b for snippet jump
            keymap = {
                ["<CR>"]      = { "accept", "fallback" },
                ["<Up>"]      = { "select_prev", "fallback" },
                ["<Down>"]    = { "select_next", "fallback" },
                ["<C-f>"]     = { "snippet_forward", "fallback" },
                ["<C-b>"]     = { "snippet_backward", "fallback" },
            },

            appearance = {
                nerd_font_variant = "mono", -- for best icon alignment with Nerd Font Mono
            },
            -- Always show documentation for the currently selected completion item
            completion = {
                documentation = { auto_show = true }
            },

            -- Extendable sources: add more in another config file with opts_extend
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            -- Use the Rust fuzzy matcher if available, fallback to Lua with a warning
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },

        -- This allows you to extend the default sources elsewhere in your config:
        -- Example: require("blink.cmp").setup({ sources = { default = { "emoji" } } })
        opts_extend = { "sources.default" },
    },


    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        opts = {
            -- These options are still valid for parser management
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", "python", "rust" },
            sync_install = false,
            auto_install = true,
        },
        config = function(_, opts)
            require("nvim-treesitter").setup(opts)
            -- Always enable Tree-sitter highlighting for every buffer
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
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
