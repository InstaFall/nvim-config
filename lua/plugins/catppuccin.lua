return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- 👈 Force Mocha as default
        auto_integrations = true,
      }
      vim.cmd.colorscheme("catppuccin") -- 👈 Apply colorscheme here
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- This stays the same
    },
  },
}
