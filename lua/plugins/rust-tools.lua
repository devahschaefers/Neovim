local rust_tools = require("rust-tools")

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', 'K', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
        end
    }

})
