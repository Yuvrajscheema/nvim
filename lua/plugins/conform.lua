return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        typescript = { { "prettierd", "prettier", stop_after_first = true } },
        json = { { "prettierd", "prettier", stop_after_first = true } },
        java = { "google-java-format" },
        markdown = { { "prettierd", "prettier", stop_after_first = true } },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        rust = { "rustfmt", },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        css = { { "prettierd", "prettier", stop_after_first = true } },
        sh = { "shellcheck" },
        python = { "black" }
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
