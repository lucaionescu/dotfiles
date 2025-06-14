require('mason').setup({})
require('mason-lspconfig').setup({})

require('lspconfig').clangd.setup({})
require('lspconfig').pylsp.setup({})
require('lspconfig').ruff.setup({})

require('cmp').setup({})
require('cmp_nvim_lsp').setup({})

require('lspconfig').clojure_lsp.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

