local opts = { noremap = true }

vim.keymap.set("i", "jj", "<Esc>:w<CR>", opts)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<c-w>b", ":split<CR>")

-- resize windows
vim.keymap.set("n", "<up>", ":resize -5<CR>")
vim.keymap.set("n", "<down>", ":resize +5<CR>")
vim.keymap.set("n", "<left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<right>", ":vertical resize +5<CR>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("c", "W", "w", opts)
