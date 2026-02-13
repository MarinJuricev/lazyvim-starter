return {
  "stevearc/conform.nvim",
  keys = {
    -- Disable the default <leader>cf keybind
    { "<leader>cf", false },
    {
      "<leader>fc",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
    },
  },
}
