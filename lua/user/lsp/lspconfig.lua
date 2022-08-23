local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

nvim_lsp.pyright.setup{
    on_attach = on_attach,
}
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
nvim_lsp.tailwindcss.setup {}
nvim_lsp.clangd.setup{
    on_attach = on_attach,
    filetypes = {"c", "cpp", "objc", "objcpp", "cuda"},
    cmd = {"clangd"}
}
nvim_lsp.emmet_ls.setup {
  on_attach = on_attach,
  filetypes = { 
    "html",
    "typescriptreact",
    "javascriptreact",
    "css",
    "sass",
    "scss",
    "less" 
},
  cmd = { "emmet-ls", "--stdio" }
}
nvim_lsp.html.setup {
  on_attach =  on_attach,
  filetypes = {"html"},
  init_options = {
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  },
  provideFormatter = true
}
}
nvim_lsp.cssls.setup {
  on_attach = on_attach,
  filetypes = { "css", "scss", "less" }
}
nvim_lsp.cssmodules_ls.setup {
  on_attach = on_attach,
  cmd = { "cssmodules-language-server" },
  filetypes = { 
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css",
    "scss",
    "less"
  }
}

