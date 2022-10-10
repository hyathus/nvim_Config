local nvim_lsp = require("lspconfig")

local has_formatter = { "gopls", "html", "rust_analyzer", "sumneko_lua", "tsserver", "cssls" }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
local opt = {

    on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<Leader>j", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<Leader>k", vim.lsp.buf.rename, opts)
        local should_format = true
        for _, value in pairs(has_formatter) do
            if client.name == value then
                should_format = false
            end
        end
        if not should_format then
            client.resolved_capabilities.document_formatting = false
        end
    end,

    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    flags = {
        debounce_text_changes = 150,
    },
}

require("mason-lspconfig").setup_handlers({
    function(server_name)
        nvim_lsp[server_name].setup({})
    end,
    ["tsserver"] = function()
        nvim_lsp.tsserver.setup({
            opt,
            server = {
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            },
            filetypes = {
                "javascript",
                "javascriptreact",
                "javascript.jsx",
                "typescript",
                "typescriptreact",
                "typescript.tsx",
            },
        })
    end,
    ["cssls"] = function()
        nvim_lsp.cssls.setup({
            opt,
            filetypes = { "css", "scss", "less" },
        })
    end,
    ["pyright"] = function()
        nvim_lsp.pyright.setup({
            opt,
            filetypes = { "python" },
        })
    end,
    ["html"] = function()
        nvim_lsp.html.setup({
            opt,
            filetypes = { "html", "eruby" },
        })
    end,
    ["cssmodules_ls"] = function()
        nvim_lsp.cssmodules_ls.setup({
            opt,
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "html",
                "css",
            },
        })
    end,
    ["jsonls"] = function()
        nvim_lsp.jsonls.setup({
            opt,
            commands = {
                Format = {
                    function()
                        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
                    end,
                },
            },
        })
    end,
    ["tailwindcss"] = function()
        nvim_lsp.tailwindcss.setup({
            opt,
        })
    end,
    ["vimls"] = function()
        nvim_lsp.vimls.setup({
            opt,
            filetypes = { "vim" },
        })
    end,
    ["clangd"] = function()
        nvim_lsp.clangd.setup({
            opt,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        })
    end,
    ["omnisharp"] = function()
        nvim_lsp.omnisharp.setup({
            opt,
        })
    end,
    ["sumneko_lua"] = function()
        nvim_lsp.sumneko_lua.setup({
            opt,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    end,
})

if not require("lspconfig.configs").ls_emmet then
    require("lspconfig.configs").ls_emmet = {
        default_config = {
            cmd = { "ls_emmet", "--stdio" },
            filetypes = {
                "html",
                "css",
                "scss",
                "javascriptreact",
                "typescriptreact",
                "haml",
                "xml",
                "xsl",
                "pug",
                "slim",
                "sass",
                "stylus",
                "less",
                "sss",
                "hbs",
                "handlebars",
            },
            root_dir = function(_)
                return vim.loop.cwd()
            end,
            settings = {},
        },
    }
end

nvim_lsp.ls_emmet.setup({ opt })
