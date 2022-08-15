local null_ls_status, null_ls = pcall(require, "null_ls")
if (not null_ls_status) then
      return
end

local formatting = null_ls.builtings.formatting
local diagnostics = null_ls.builtings.diagnostics


require("null-ls").setup({
    sources = {
       sources = {
             diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    diagnostics.fish,
    formatting.prettier,
    formatting.black,
    formatting.gofmt,
    formatting.shfmt,
    formatting.clang_format,
    formatting.cmake_format,
    formatting.dart_format,
    formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
     }),
    formatting.isort, formatting.codespell.with({filetypes = {'markdown'}})
  },
  }
})

