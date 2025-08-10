return {
  {
    "EthanJWright/vs-tasks.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>ta",
        "<cmd>lua require('telescope').extensions.vstask.tasks()<CR>",
        desc = "VS Tasks",
      },
      {
        "<leader>ti",
        "<cmd>lua require('telescope').extensions.vstask.inputs()<CR>",
        desc = "VS Task Inputs",
      },
      {
        "<leader>tj",
        "<cmd>lua require('telescope').extensions.vstask.jobs()<CR>",
        desc = "VS Task Jobs",
      },
      {
        "<leader>td",
        "<cmd>lua require('telescope').extensions.vstask.clear_inputs()<CR>",
        desc = "Clear Task Inputs",
      },
      {
        "<leader>tc",
        "<cmd>lua require('telescope').extensions.vstask.cleanup_completed_jobs()<CR>",
        desc = "Cleanup Completed Jobs",
      },
      {
        "<leader>tl",
        "<cmd>lua require('telescope').extensions.vstask.launch()<CR>",
        desc = "Launch Task",
      },
      {
        "<leader>tm",
        "<cmd>lua require('telescope').extensions.vstask.command()<CR>",
        desc = "Task Command",
      },
    },
  },
}
