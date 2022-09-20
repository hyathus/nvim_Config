local nls = require("null-ls")
local nls_utils = require("null-ls.utils")
local b = nls.builtins

--########################################################################

local async_formatting = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                local client = vim.lsp.get_client_by_id(ctx.client_id)
                vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                async_formatting(bufnr)
            end,
        })
    end
end

--###############################################################################

local sources = {
    -- formatting
    b.formatting.prettierd.with {
        extra_filetypes = { "toml", "solidity" },
        extra_args = { "--no-semi", "single-quote", "--jsx-single-quote" },
    },
    b.formatting.stylua,
    b.formatting.shfmt,
    b.formatting.fixjson,
    b.formatting.black.with({ extra_args = { "--fast" } }),
    b.formatting.isort,
    b.formatting.cmake_format.with({
        filetypes = { "cpp", "c", "cs" },
    }),

    -- diagnostics
    b.diagnostics.write_good,
    -- b.diagnostics.markdownlint,
    b.diagnostics.cmake_lint.with({
        filetypes = { "cpp", "c", "cs" },
    }),
    b.diagnostics.flake8,
    b.diagnostics.xo,
    b.diagnostics.selene,
    b.diagnostics.shellcheck,

    -- code actions
    b.code_actions.gitrebase,

    -- hover
    b.hover.dictionary,
}
nls.setup({
    debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = on_attach,
    root_dir = nls_utils.root_pattern(".git"),
})
