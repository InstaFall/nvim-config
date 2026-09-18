return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    -- Explicitly bind standard C/C++ filetypes to clang-format
    opts.formatters_by_ft["c"] = { "clang-format" }
    opts.formatters_by_ft["cpp"] = { "clang-format" }

    -- Keep the doxygen mappings just in case they trigger later
    opts.formatters_by_ft["c.doxygen"] = { "clang-format" }
    opts.formatters_by_ft["cpp.doxygen"] = { "clang-format" }
  end,
}
