pcall(require, "impatient")
require("user.plugins")
require("user.options")
require("user.keymaps")
require("user.lsp")
require("user.onedark")
require("user.colortils")

vim.cmd("colorscheme onedark")
vim.g.material_style = "palenight"
