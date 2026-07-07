return
  -- { "catppuccin/nvim",
-- name = "catppuccin",
-- priority = 1000,
-- config = function()
--     vim.cmd("colorscheme catppuccin-macchiato")
--
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
-- }
--

-- {
--     'AlexvZyl/nordic.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('nordic').load()
--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     end
-- }
{
  "neanias/everforest-nvim",
  name = "everforest",
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup({
      transparent_background_level = 1, -- optional, but plays nicer with bg=none
    })
    vim.cmd.colorscheme("everforest")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
