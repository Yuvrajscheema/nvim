return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        bash = { "beautysh" },
        rust = { "rustfmt", },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        python = { "black" },
        zig = { "zigfmt" },
        vhdl = { "ghdl" }
      },
      stop_after_first = true
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
