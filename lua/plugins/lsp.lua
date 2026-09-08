return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          root_dir = function(fname)
            -- If fname is passed as a buffer number, convert it to a file path
            if type(fname) == "number" then
              fname = vim.api.nvim_buf_get_name(fname)
            end

            -- Guard against virtual diffview URIs, git stage buffers, and empty names
            if not fname or fname == "" or fname:match("^diffview://") or fname:match("^:%d+:") then
              return nil
            end

            return require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
          end,

          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--query-driver=**gcc*,**g++*,**clang*,**clang++*,**arm-none-eabi-gcc*,**arm-none-eabi-g++*",
          },
        },
      },
    },
  },
}
