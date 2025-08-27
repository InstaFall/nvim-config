-- return {}
return {
  -- {
  --   "akinsho/bufferline.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     if (vim.g.colors_name or ""):find("catppuccin") then
  --       opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
  --     end
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin-mocha",
  --   },
  -- },
}
