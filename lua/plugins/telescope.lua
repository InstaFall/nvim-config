return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- Make sure other extensions are preserved
      opts.extensions = opts.extensions or {}

      -- Nothing specific needed for vstask itself, just load it
      require("telescope").load_extension("vstask")
    end,
  },
}
