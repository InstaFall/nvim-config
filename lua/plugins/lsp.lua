return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            -- Whitelist ARM GCC so clangd can extract its standard include paths
            "--query-driver=**gcc*,**g++*,**clang*,**clang++*,**arm-none-eabi-gcc*,**arm-none-eabi-g++*",
          },
        },
      },
    },
  },
}
