-- settings
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

vim.cmd.colorscheme('github_dark_dimmed')
vim.cmd.language('en_US')

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevelstart = 99

vim.opt.laststatus = 3

-- mappings
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
vim.keymap.set({"n", "v"}, "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<c-w>b", ":split<CR>")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("c", "W", "w", opts)

vim.keymap.set("n", "tt", ":tabedit<CR>", opts)

vim.keymap.set("n", ">", ">>", opts)
vim.keymap.set("n", "<", "<<", opts)

vim.keymap.set("n", ">", ">>", opts)
vim.keymap.set("n", "<", "<<", opts)

-- resize windows
vim.keymap.set("n", "<up>", ":resize -5<CR>")
vim.keymap.set("n", "<down>", ":resize +5<CR>")
vim.keymap.set("n", "<left>", ":vertical resize -5<CR>")
vim.keymap.set("n", "<right>", ":vertical resize +5<CR>")

-- packer
vim.cmd.packadd('packer.nvim')

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
          {'nvim-telescope/telescope-file-browser.nvim'},
      }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('tpope/vim-fugitive')

  use('projekt0n/github-nvim-theme')

  use('windwp/nvim-autopairs')

  use('mbbill/undotree')

  use('norcalli/nvim-colorizer.lua')

  use('neovim/nvim-lspconfig')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')

  use('Olical/conjure')
end)

