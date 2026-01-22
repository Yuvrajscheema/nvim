return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { desc = "Toggle Colorizer"})
    keymap.set("n", "<leader>ca", "<cmd>ColorizerAttachToBuffer<cr>", { desc = "Attatch Colorizer to current buffer"})
  end,
}
