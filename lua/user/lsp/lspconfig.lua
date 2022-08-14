local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingPorvider then 
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.Formatting_seq_sunc()]]
    vim.api.nvim_command [[autogroup END]]
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
