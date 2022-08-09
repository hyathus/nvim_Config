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

-- Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 3
vim.o.shiftwidth = 3
vim.bo.shiftwidth = 4

vim.o.autoindent = true
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
set.lazyredraw =true
set.updatetime = 100
set.fileencoding = 'utf-8'

set.splitbelow = true


vim.g.mapleader = ' '


vim.cmd [[
	colorscheme tokyonight
]]
