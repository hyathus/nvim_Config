vim.keymap.set("n", "<Leader>w", ":write<CR>")
vim.keymap.set("n", "<Leader>q", ":q<CR>")

vim.keymap.set("n", "<Leader>e", ":NvimTreeOpen<CR>")
vim.keymap.set("n", "<Leader>r", ":Ntree<CR>")

-- LSP
vim.keymap.set("n", "<Leader>nl", ":NullLsInfo<CR>")
vim.keymap.set("n", "<Leader>ms", ":Mason<CR>")
-- Buffer  Tab move

vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>")
vim.keymap.set("n", "bd", ":bdelete<CR>")

vim.keymap.set("v", "<Leader>a", ":Commentary<CR>")

--Bracey

vim.keymap.set("n", "<Leader>Q", ":Bracey<CR>")
vim.keymap.set("n", "<Leader>W", ":BraceyStop<CR>")
vim.keymap.set("n", "<Leader>t", ":Trouble<CR>")
