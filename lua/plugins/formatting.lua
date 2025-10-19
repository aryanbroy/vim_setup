return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, existing)
      return vim.tbl_deep_extend("force", {}, existing or {}, {
        formatters_by_ft = vim.tbl_deep_extend("force", {}, existing and existing.formatters_by_ft or {}, {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          lua = { "stylua" },
          python = { "isort", "black" },
        }),
        formatters = vim.tbl_deep_extend("force", {}, existing and existing.formatters or {}, {
          prettier = { prepend_args = { "--single-quote", "--trailing-comma", "es5" } },
        }),
      })
    end,
    keys = {
      {
        "<leader>mp",
        function()
          require("conform").format({ lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format file or visual selection",
      },
    },
  },
}
