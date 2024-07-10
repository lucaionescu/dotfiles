vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.showcmd = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.cursorline = true

-- TOOD not yet working correctly as it folds everything by default
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldmethod = 'expr'

vim.cmd.colorscheme('github_dark_dimmed')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99

vim.opt.laststatus = 3
