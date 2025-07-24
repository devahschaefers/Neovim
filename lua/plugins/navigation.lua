return {
    {
        'nvim-telescope/telescope.nvim', --tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        },
    },
}
