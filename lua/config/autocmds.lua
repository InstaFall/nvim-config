-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  -- Expanded pattern to trigger for source files too
  pattern = { "*.h", "*.hpp", "*.c", "*.cpp" },
  callback = function(args)
    -- Get the contents of the buffer
    local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)

    -- Only insert the template if the file is completely empty
    if #lines == 0 or (#lines == 1 and lines[1] == "") then
      -- Safely get the filename and extension
      local filepath = vim.api.nvim_buf_get_name(args.buf)
      local filename = vim.fn.fnamemodify(filepath, ":t")
      local ext = vim.fn.fnamemodify(filepath, ":e")

      if filename == "" then
        return
      end

      -- Generate current date for Doxygen
      local current_date = os.date("%Y-%m-%d")

      -- Basic Doxygen file header block
      local template = {
        "/**",
        " * \\file " .. filename,
        " * \\author ", -- Feel free to hardcode your actual name here
        " * \\brief ", -- We will place the cursor here!
        " * \\date " .. current_date,
        " */",
        "",
      }

      -- Conditionally add Include Guards ONLY if it's a header file
      if ext == "h" or ext == "hpp" then
        local guard = filename:upper():gsub("[^%w]", "_")
        table.insert(template, "#ifndef " .. guard)
        table.insert(template, "#define " .. guard)
        table.insert(template, "")
        table.insert(template, "")
        table.insert(template, "")
        table.insert(template, "#endif /* " .. guard .. " */")
      end

      -- Insert the text
      vim.api.nvim_buf_set_lines(args.buf, 0, -1, false, template)

      -- Safely place cursor on the \brief line (line 4) right after the space
      vim.schedule(function()
        if vim.api.nvim_get_current_buf() == args.buf then
          -- { 4, 10 } means Line 4, Column 10 (right after " * \brief ")
          vim.api.nvim_win_set_cursor(0, { 4, 10 })
          -- Optional: Start insert mode immediately
          -- vim.cmd("startinsert")
        end
      end)
    end
  end,
  desc = "Auto-insert doxygen header and include guard for new or empty files",
})
