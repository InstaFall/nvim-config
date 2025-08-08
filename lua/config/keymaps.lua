-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

vim.keymap.set("n", "<leader>rn", ":IncRename ")

vim.keymap.set("n", "<A-w>", ":b#<bar>bd#<CR>",
  { desc = "Close current buffer and switch to previous", silent = true, noremap = true })

-- Bufferline ordinal tab switching with Alt+1..Alt+9
for i = 1, 6 do
  vim.keymap.set("n", "<C-t>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end, { desc = "Go to buffer tab " .. i, silent = true })
end
