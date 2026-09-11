return {
  "ibhagwan/fzf-lua",

  keys = {
    {
      "<leader>sG",
      function()
        local fzf = require("fzf-lua")

        local current_dir = vim.fn.expand("%:p:h")

        local function pick_dir()
          fzf.fzf_exec("printf '%s\\n' '..' && find . -mindepth 1 -type d -not -path '*/.git/*' | sort", {
            cwd = current_dir,
            prompt = "Grep Directory> ",
            file_icons = false,
            color_icons = false,
            fzf_opts = {
              ["--no-multi"] = true,
            },

            actions = {
              ["default"] = function(selected)
                local dir = selected[1]
                if not dir then
                  return
                end

                if dir == ".." then
                  current_dir = vim.fn.fnamemodify(current_dir, ":h")
                else
                  current_dir = vim.fn.fnamemodify(current_dir .. "/" .. dir, ":p")
                end

                pick_dir()
              end,

              ["ctrl-g"] = function()
                fzf.live_grep({
                  cwd = current_dir,
                })
              end,
            },
          })
        end

        pick_dir()
      end,
      desc = "Grep (Choose Dir)",
      mode = "n",
    },

    {
      "<leader>so",
      function()
        local pickers = Snacks.picker.get({ source = "explorer" })
        local picker = pickers[1]

        if not picker then
          vim.notify("Snacks Explorer is not open", vim.log.levels.WARN)
          return
        end

        local item = picker:selected({ fallback = true })[1]

        if not item or not item.file then
          vim.notify("No Explorer item selected", vim.log.levels.WARN)
          return
        end

        local dir = item.dir and item.file or vim.fs.dirname(item.file)

        require("fzf-lua").live_grep({
          cwd = dir,
        })
      end,
      desc = "Grep (Explorer Dir)",
    },
  },
}
