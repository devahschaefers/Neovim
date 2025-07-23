local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<leader>m", 
  function()
    vim.cmd.RustLsp('debuggables') 
    ToggleDapUI()
  end,
  { silent = true, buffer = bufnr }
)
