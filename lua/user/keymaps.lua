vim.keymap.set('n', '<Leader>w', ':write<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')

vim.keymap.set('n','<Leader>e', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<Leader>r', ':Ntree<CR>')

-- Buffer  Tab move

vim.keymap.set('n', '<TAB>', ':bnext<CR>')
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>')
vim.keymap.set('n', 'bd', ':bdelete<CR>')

vim.keymap.set('v', '<S-a>', ':Commentary<CR>')

--Bracey

vim.keymap.set('n', '<Leader>Q', ':Bracey<CR>')
vim.keymap.set('n', '<Leader>W', ':BraceyStop<CR>')

