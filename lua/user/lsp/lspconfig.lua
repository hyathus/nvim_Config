require('lspconfig').pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig').tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig').emmet_ls.setup{}
require('lspconfig').sumneko_lua.setup {}
require'lspconfig'.tailwindcss.setup{}
