-- global keymaps for every LSP buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user.lsp', {}),
  callback = function(ev)
    local map = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, { buffer = ev.buf, silent = true })
    end
    map('gd',  vim.lsp.buf.definition)
    map('gD',  vim.lsp.buf.declaration)
    map('gi',  vim.lsp.buf.implementation)
    map('gr',  vim.lsp.buf.references)
    map('K',   vim.lsp.buf.hover)
    local buffer = ev.buf
    -- -- enable inlay hints if supported
    -- local inlay = vim.lsp.inlay_hint.enable(true, {bufnr = buffer})
    -- -- keybind to toggle inlay hints
    map('<leader>lth', function()
      -- second arg is the buffer, 0 means current buffer
      vim.lsp.inlay_hint.enable( not vim.lsp.inlay_hint.is_enabled(), 0)
    end
    )
  end,
})

-- optional lua-ls settings (was: lsp.nvim_lua_ls())
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace   = { checkThirdParty = false },
    },
  },
})

-- :Rename command (same as before)
vim.api.nvim_create_user_command('Rename', function()
  vim.lsp.buf.rename()
end, {})
