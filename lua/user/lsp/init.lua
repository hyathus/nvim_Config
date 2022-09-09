require('user/lsp/cmp')
require('user/lsp/lsp')

require("mason").setup({
    ui = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = {
        "emmet_ls",
        "clangd",
        "cssmodules_ls",
        "cssls",
        "html",
        "jsonls",
        "pyright",
        "tailwindcss",
    }
}
