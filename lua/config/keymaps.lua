-- Yank diagnostic message to clipboard
vim.keymap.set("n", "<leader>cy", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics > 0 then
