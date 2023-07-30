vim.g.mapleader = " "
vim.g.maplocalleader = " "

--move highlighed code blocks around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") --TODO add for arrow keys (while shifted)
--keep cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


--nvim-tree
vim.keymap.set("n", "<leader>fe", ":NvimTreeToggle<CR>")
