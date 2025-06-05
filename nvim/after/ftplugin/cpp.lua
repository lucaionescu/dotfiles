-- ~/.config/nvim/ftplugin/cpp.lua

vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

vim.api.nvim_create_user_command("Build", function()
  vim.cmd("write")
  vim.cmd("!make -j -s 2>&1 && make RunRelease")
end, {})

vim.keymap.set("n", "<C-b>", ":Build<CR>", { noremap = true, silent = true })
