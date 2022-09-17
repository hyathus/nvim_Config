require('user.lsp.cmp')
require('user.lsp.lsp')

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
require("mason-lspconfig").setup ({
    ensure_installed = {
        "clangd",
        "omnisharp",
        "cssmodules_ls",
        "cssls",
        "html",
        "jsonls",
        "pyright",
        "tailwindcss",
        "sumneko-lua",
        "bashls"
    }
})

require('user.lsp.null-ls')
require('user.lsp.mason_tool')
