return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")

    local parsers = {
      "json",
      "java",
      "typescript",
      "javascript",
      "tsx",
      "yaml",
      "typst",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
      "c",
      "cpp",
      "cmake",
      "make",
      "latex",
      "rst",
      "rust",
      "python",
      "asm",
      "zig",
      "vhdl"
    }
    treesitter.install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = parsers,
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
