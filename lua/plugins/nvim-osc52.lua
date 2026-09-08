return {
  {
    "ojroques/nvim-osc52",
    lazy = false,
    config = function()
      require("osc52").setup({
        silent = true,
      })

      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Auto copy to clipboard",
        callback = function()
          if vim.v.event.operator == "y" then
            require("osc52").copy_register("")
          end
        end,
      })
    end,
  },
}
