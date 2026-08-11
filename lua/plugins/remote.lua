return {
    {
        "amitds1997/remote-nvim.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            ssh_config = {
                ssh_config_file_paths = { "$HOME/.ssh/config" },
            },
        },
        config = function(_, opts)
            require("remote-nvim").setup(opts)

            vim.api.nvim_create_user_command("RemoteHive12", function()
                require("remote-nvim").session_provider
                    :get_or_initialize_session({
                        host = "hive12",
                        provider_type = "ssh",
                        conn_opts = {
                            "ssh -o RequestTTY=no -o RemoteCommand=none hive12",
                        },
                    })
                    :launch_neovim()
            end, { desc = "Start remote Neovim on hive12" })
        end,
    },
}
