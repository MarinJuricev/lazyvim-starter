-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>ff")

-- Set <leader>sf to find files using snacks
vim.keymap.set("n", "<leader>sf", function()
  require("snacks").picker.files()
end, { desc = "Find Files (Root Dir)" })

-- Yank diagnostic message to clipboard
vim.keymap.set("n", "<leader>ye", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics > 0 then
    vim.fn.setreg("+", diagnostics[1].message)
    vim.notify("Copied diagnostic to clipboard", vim.log.levels.INFO)
  else
    vim.notify("No diagnostic at cursor", vim.log.levels.WARN)
  end
end, { desc = "Copy diagnostic message" })
