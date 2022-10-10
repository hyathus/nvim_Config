require("user.lsp.cmp")
require("user.lsp.lsp")

require("mason").setup({
	ui = {
		border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
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
		"bashls",
		"tsserver",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {

		-- Formatting
		"prettierd",
		"shfmt",
		"fixjson",
		"black",
		"isort",
		"stylua",

		--Diagnostics
		"cmakelang",
		"write-good",
		"flake8",
		"selene",
		"shellcheck",
	},
	run_on_start = true,
})

require("user.lsp.null_ls")
