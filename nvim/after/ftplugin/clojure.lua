vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*.clj', '*.cljs'},
    callback = function(_)
        vim.lsp.buf.format({ async = true })
    end
})
