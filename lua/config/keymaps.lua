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

-- Window width adjustments
vim.keymap.set("n", "<C-x>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-z>", "<C-w>>", { desc = "Increase window width" })


-- Copy current file path
vim.keymap.set("n", "<leader>fP", function()
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("No file currently open")
    return
  end
  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy file path" })
