local opt = vim.opt

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.rust_recommended_style = 0

opt.relativenumber = true
opt.number = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

opt.termguicolors = true
opt.colorcolumn = "80"

opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
