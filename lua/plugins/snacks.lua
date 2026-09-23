return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = false, -- Show hidden files (dotfiles)
          ignored = true, -- Show files ignored by .gitignore
        },
      },
    },
  },
}
