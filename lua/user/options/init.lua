local set = vim.opt

-- File
set.spell = false
set.wrap = false
set.ruler = false
set.conceallevel = 2
set.mouse = "a"
set.encoding = "UTF-8"
set.fileencoding = "UTF-8"
set.scrolloff = 5
set.timeoutlen = 300
set.updatetime = 500
set.hlsearch = false
set.clipboard:prepend({"unnamedplus"})
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
set.colorcolumn = '80'
set.foldenable = true
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldlevelstart = 10
vim.opt.foldtext = 'v:lua.require("essentials").simple_fold()'

--> Visual settings?
set.pumblend = 5
set.inccommand = "split"
set.termguicolors = true
set.background = "dark"
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

--> Misc settings
set.signcolumn = "yes:1"
-----------------------------------------------
vim.g.mapleader = ' '
