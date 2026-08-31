return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  opts = {},
  keys = {
    -- 1. Open diff history for the entire project repository
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview Repo History" },

    -- 2. Open diff history ONLY for the active file buffer
    { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },

    { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gC", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
