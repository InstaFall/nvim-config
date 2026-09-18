return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          cmd = {
            vim.fn.stdpath("data") .. "/mason/bin/yaml-language-server",
            "--stdio",
          },
        },

        clangd = {
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
