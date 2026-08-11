--hybrid line numbers vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

vim.opt.smartindent=true

vim.opt.hlsearch=false
vim.opt.incsearch=true

vim.opt.termguicolors=true
vim.opt.scrolloff=8


--disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

--folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

--clipboard
vim.opt.clipboard = "unnamedplus"

--diagnostics
vim.diagnostic.config({
    -- virtual_lines = true, -- give errors as lines below
    virtual_text = true, -- give errors as inlined on the line with the error
    signs = true,
    underline = true,
})

-- Dont gray out unused code 
-- Why?: Will often write alot of modules before they are called from the main thread
--       Most strict linting rules would consider that "unused code" which is annoying
--       It will also prevent those areas from being linted or have any lsp features
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = nil })


-- turn off line wrap
vim.opt.wrap = false
