local set = vim.keymap.set

set("n", "<leader>pv", ":Ex<CR>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '>-2<CR>gv=gv")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("x", "<leader>p", "\"_dP")

set("n", "<leader>y", "\"+y")
set("v", "<leader>y", "\"+y")
set("n", "<leader>Y", "\"+Y")

set("n", "<leader>d", "\"_d")
set("v", "<leader>d", "\"_d")

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})

set("n", "<leader>u", ":UndotreeToggle<CR>")

set("n", "<leader>ls", ":LspStop<CR>")
set("n", "<leader>li", ":lua vim.diagnostic.open_float()<CR>")
set("n", "<leader>cg", ":setlocal spell spelllang=en_ca<CR>")
