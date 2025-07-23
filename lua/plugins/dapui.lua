vim.keymap.set("n", "<leader>b", ":DapToggleBreakpoint <CR>")

dapui = require("dapui")

dapui.setup()

function ToggleDapUI()
  dapui.toggle()
end


require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})


