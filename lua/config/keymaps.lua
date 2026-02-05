-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>ff")

-- Set <leader>sf to find files using snacks
vim.keymap.set("n", "<leader>sf", function()
  require("snacks").picker.files()
end, { desc = "Find Files (Root Dir)" })
