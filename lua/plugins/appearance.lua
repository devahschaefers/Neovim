-- should prolly move this somewhere else
function setColors(color)
    color = color
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            {
                'nvim-tree/nvim-web-devicons',
                opts = {
                    -- your personnal icons can go here (to override)
                    -- you can specify color or cterm_color instead of specifying both of them
                    -- DevIcon will be appended to `name`

                    -- globally enable different highlight colors per icon (default to true)
                    -- if set to false all icons will have the default icon's color
                    color_icons = true;
                    -- globally enable default icons (default to false)
                    -- will get overriden by `get_icons` option
                    default = true;
                    -- globally enable "strict" selection of icons - icon will be looked up in
                    -- different tables, first by filename, and if not found by extension; this
                    -- prevents cases when file doesn't have any extension but still gets some icon
                    -- because its name happened to match some extension (default to false)
                    strict = true;
                    -- same as `override` but specifically for overrides by filename
                    -- takes effect when `strict` is true
                    override_by_filename = {
                        [".gitignore"] = {
                            icon = "",
                            color = "#f1502f",
                            name = "Gitignore"
                        }
                    };
                    -- same as `override` but specifically for overrides by extension
                    -- takes effect when `strict` is true
                    override_by_extension = {
                        ["log"] = {
                            icon = "",
                            color = "#81e043",
                            name = "Log"
                        }
                    };
                },
            },
        },
        opts = {
            options = {
                icons_enabled = true,
                theme = "catppuccin",
            }
        }
    },
    {
        "RRethy/vim-illuminate"
    },

    -- {
    --     'Mofiqul/dracula.nvim',
    --     opts = {
    --         transparent_bg = true,
    --     },
    --     config = function (_, opts)
    --         require("dracula").setup(opts)
    --         vim.cmd.colorscheme("dracula-soft")
    --     end
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        flavour = "auto",
        opts = {
            transparent_background = true,
            integrations = {
                -- see https://github.com/catppuccin/nvim#integrations (SO MANY MORE) TODO
                treesitter = true,
                nvimtree = true,
                blink_cmp = true,
                dap_ui = true,
                -- need to look into this more
                indent_blankline = {
                    enabled = true,
                    scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                    colored_indent_levels = true,
                },
            },
            color_overrides = {
                 macchiato = {
                    -- Punch up the background and accents for more contrast
                    -- base    = "#181825",
                    -- mantle  = "#161622",
                    -- crust   = "#11111b",
                    surface0 = "#313244",
                    surface1 = "#45475a",
                    text    = "#ffffff",
                    subtext1 = "#bac2de",
                    overlay1 = "#7f849c",
                    -- Vibrant, punchy accents
                    mauve   = "#cba6f7",
                    blue    = "#89b4fa",
                    peach   = "#fab387",
                    yellow  = "#f9e2af",
                    red     = "#f38ba8",
                    green   = "#a6e3a1",
                    teal    = "#94e2d5",
                    flamingo = "#f2cdcd",
                },
            },
            custom_highlights = function(colors)
                return {
                    -- Comments: subtle but readable
                    Comment = { fg = colors.overlay1, style = { "italic" } },
                    -- Keywords: punchy purple
                    ["@keyword"] = { fg = colors.mauve, style = { "bold" } },
                    -- Functions: vibrant blue
                    ["@function"] = { fg = colors.blue, style = { "bold" } },
                    -- Types/classes: warm yellow
                    ["@type"] = { fg = colors.yellow, style = { "bold" } },
                    ["@class"] = { fg = colors.yellow, style = { "bold" } },
                    -- Variables: light white 
                    ["@variable"] = { fg = colors.text },
                    -- Constants/numbers: peach
                    ["@constant"] = { fg = colors.peach },
                    ["@number"] = { fg = colors.peach },
                    -- Strings: bright green
                    ["@string"] = { fg = colors.green },
                    -- Properties/attributes: peach
                    ["@property"] = { fg = colors.peach },
                    -- Regex/special: teal
                    ["@string.regex"] = { fg = colors.teal },
                    -- Comments/doc: overlay1
                    ["@comment.documentation"] = { fg = colors.overlay1, style = { "italic" } },
                    -- UI tweaks for punchier look
                    LineNr = { fg = colors.overlay1 },
                    CursorLineNr = { fg = colors.yellow, style = { "bold" } },
                    Visual = { bg = colors.surface1 },
                    -- these get overriden by the transperency stuff later
                    -- Pmenu = { bg = colors.mantle },
                    -- PmenuSel = { bg = colors.surface0, fg = colors.text },
                    -- Diagnostic colors
                    DiagnosticError = { fg = colors.red },
                    DiagnosticWarn = { fg = colors.peach },
                    DiagnosticInfo = { fg = colors.blue },
                    DiagnosticHint = { fg = colors.teal },

                    -- transperency stuff
                    -- Hover/documentation windows - fully solid
                    NormalFloat = { bg = colors.base, fg = colors.text },
                    FloatBorder = { bg = colors.base, fg = colors.blue },

                    -- Completion menu - fully solid
                    Pmenu = { bg = colors.base, fg = colors.text },
                    PmenuSel = { bg = colors.surface0, fg = colors.text },
                    PmenuBorder = { bg = colors.base, fg = colors.blue },

                    -- Scrollbar in completion - fully solid
                    PmenuSbar = { bg = colors.surface1 },
                    PmenuThumb = { bg = colors.overlay0 },


                    -- Telescope
                    TelescopeNormal = {}, -- This effectively makes its background transparent
                    TelescopeBorder = {},      -- ToggleTerm - Fully Solid

                }
            end,
            
        },
        config = function (_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin-macchiato")
        end
    },
}


