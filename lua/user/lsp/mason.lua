require ("mason").setup{}

require ("mason.lspconfig").setup {
  ensure_installed = {"taildwindcss"}
}

require 'lspconfig'.taildwindcss.setup {}


