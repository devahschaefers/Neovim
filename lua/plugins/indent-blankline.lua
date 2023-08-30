vim.opt.list = true
vim.opt.listchars = "eol:↵,trail:·,tab:  "

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    use_treesitter_scope = true,
    show_current_context = true,
    show_current_context_start = true,
}
