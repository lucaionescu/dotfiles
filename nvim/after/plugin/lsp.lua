require('mason').setup({})
require('mason-lspconfig').setup({})

require('lspconfig').clangd.setup({})
require('lspconfig').pylsp.setup({})
require('lspconfig').ruff.setup({})

require('lspconfig').clojure_lsp.setup({})

