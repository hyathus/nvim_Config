require('mason-tool-installer').setup {
    ensure_installed = {

        -- Formatting
    'prettierd',
    'shfmt',
    'fixjson',
    'black',
    'isort',
    'stylua',

        --Diagnostics
    'write-good',
    'flake8',
    'eslint_d',
    'xo',
    'selene',
    'shellcheck',
    },
    run_on_start = true,
}

