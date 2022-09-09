pcall(require, 'impatient')
require('user.plugins')
require('user.options')
require('user.keymaps')
vim.cmd 'colorscheme tokyonight'
vim.g.tokyonight_style = "storm"
vim.g.material_style = "deep ocean"

require("user.lsp")
