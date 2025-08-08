return {
    {
        "github/copilot.vim",
        config = function()
            -- Disable default <Tab> mapping
            vim.g.copilot_no_tab_map = true

            -- Map Ctrl+Enter to accept Copilot suggestion
            vim.api.nvim_set_keymap(
                "i",
                "<C-CR>",
                'copilot#Accept("<CR>")',
                { silent = true, expr = true, script = true }
            )
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require("ibl.hooks")

            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            require("ibl").setup({
                indent = { highlight = highlight },
            })
        end
    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function ()
            local function get_toggleterm_highlights()
                local colors = require("catppuccin.palettes").get_palette()
                return {
                    Normal = { guibg = colors.base },
                    NormalFloat = { guibg = colors.base },
                    FloatBorder = {
                        guifg = colors.base,
                        guibg = colors.base
                    },

                }
            end
            require("toggleterm").setup({
                shade_terminals = false, -- Disable automatic shading
                highlights = get_toggleterm_highlights(),
                vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true }) -- TODO: this overrides the switching panes hotkey

            })
        end,
    },

    {
        'numToStr/Comment.nvim',
        config = true, -- same as require("Comment").setup()
    },

    {
        "fladson/vim-kitty"
    },

    {
        'tpope/vim-sleuth',
    },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    }
}
