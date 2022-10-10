local set = vim.opt

-- Themes
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_italic_functions = true

-- File
set.swapfile = false
set.spell = false
set.wrap = false
set.ruler = true
set.conceallevel = 2
set.mouse = "a"
set.encoding = "UTF-8"
set.fileencoding = "UTF-8"
set.scrolloff = 5
set.sidescrolloff = 5
set.timeoutlen = 300
set.updatetime = 500
set.hlsearch = false
set.clipboard = "unnamedplus"
set.smarttab = true
set.backup = false
set.writebackup = false
set.cmdheight = 1
set.splitright = true
set.splitbelow = true
set.pumheight = 10
set.incsearch = true
set.showmode = false
set.laststatus = 3
set.completeopt = "menu,menuone,noselect"
set.virtualedit = "block"
set.cursorline = true
set.ignorecase = true

--> Fold Settings
set.colorcolumn = "120"
set.foldenable = true
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldlevelstart = 10

--> Visual settings?
set.pumblend = 5
set.inccommand = "split"
set.termguicolors = true
set.number = true
set.relativenumber = true
set.cursorcolumn = true
-- set.title = true
-- set.titlestring = "  Editing %f..."

--> Tabspace settings
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 0
set.expandtab = true
set.smartindent = true
set.breakindent = true
vim.cmd("syntax enable")
--> Misc settings
set.signcolumn = "yes:1"
-----------------------------------------------
vim.g.mapleader = " "
