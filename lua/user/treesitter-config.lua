local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end
ts.compilers = { "clang" }

ts.setup {
    ensure_installed = {
        "html",
        "lua",
        "json",
        "tsx",
        "css",
        "python",
        "cpp",
        "c_sharp",
        "javascript",
        "typescript",
        "scss",
        "bash",
    },
    highlight = { enable = true },
    autotag = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = false,
        max_file_lines = nil,
    },
    autopairs = {
        enable = true,
    }
}
