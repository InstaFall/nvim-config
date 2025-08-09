return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        context_menu = function(node, opts)
          local menu = {
            -- Default menu items would go here, or you can call the default function
          }

          -- Add copy path option
          table.insert(menu, { text = "", disabled = true }) -- separator
          table.insert(menu, {
            text = "Copy Path",
            action = function()
              local path = node.path
              vim.fn.setreg("+", path)
              vim.notify("Copied path: " .. path)
            end,
          })

          return menu
        end,
      },
    },
  }
}
