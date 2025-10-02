-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

vim.keymap.set("n", "<leader>rn", ":IncRename ")

vim.keymap.set("n", "<A-w>", function()
  local bufnr = vim.api.nvim_get_current_buf()
  -- Try switching to previous buffer
  if pcall(vim.cmd, "b#") then
    vim.cmd("bd " .. bufnr)
  else
    -- no alternate buffer, just wipe out
    vim.cmd("bd")
  end
end, { desc = "Close current buffer safely" })

-- Bufferline ordinal tab switching with Alt+1..Alt+9
for i = 1, 6 do
  vim.keymap.set("n", "<C-t>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end, { desc = "Go to buffer tab " .. i, silent = true })
end

-- Move buffers in the buffer line with CTRL + Arrow keys
vim.keymap.set("n", "<C-Left>", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<C-Right>", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })

-- Window width adjustments
vim.keymap.set("n", "<C-x>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("i", "<C-x>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-z>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("i", "<C-z>", "<C-w>>", { desc = "Increase window width" })

-- Window height adjustments
vim.keymap.set("n", "<C-t>8", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-t>9", "<C-w>-", { desc = "Increase window height" })

-- Copy current file full path
vim.keymap.set("n", "<leader>fP", function()
  local path = vim.fn.expand("%:p")
  if path == "" then
    vim.notify("No file currently open")
    return
  end
  vim.fn.setreg("+", path)
  vim.notify("Copied path: " .. path)
end, { desc = "Copy file path" })

-- Copy current file path relative to cwd
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%:.") -- relative to current working dir
  if path == "" then
    vim.notify("No file currently open")
    return
  end
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path" })
