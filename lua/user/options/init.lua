local set = vim.o

-- File
vim.o.swapfile = false
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.ignorecase = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5
pumheight = 10


-- Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

vim.opt.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true




set.relativenumber = true
set.number = true
set.cursorline = true
set.cursorcolumn = true
set.ruler = true
set.mouse = 'a'
set.syntax = false
set.clipboard = "unnamedplus"


vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5


set.lazyredraw =true
set.updatetime = 100

---------------------------------------------------
--                Encodig
-----------------------------------
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

set.splitbelow = true

vim.g.mapleader = ' '

vim.g.nvcode_termcolors = 256

vim.cmd [[
    syntax on
]]
