local keymap = vim.keymap
local opts = { noremap = true, silent = true }

vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.tabstop = 4

-- save
keymap.set('n', '<c-s>', ':w!<Return>', { desc = 'save buffer' })
-- quit
keymap.set('n', '<space>q', ':q!<Return>', { desc = 'quit' })

keymap.set('n', '<space>d', ":pu=strftime('%Y-%m-%d')<Return>")

-- Split window
keymap.set('n', 'sh', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)
keymap.set('n', 'sc', ':q<Return>', opts)

-- navigate
keymap.set('n', '<space><space>', '<c-^>', { desc = 'Prev buffer' })

-- toggle neotree
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/doc/neo-tree.txt
keymap.set('n', '<space>nt', ':Neotree toggle reveal_force_cwd<cr>', { desc = 'Toggle NeoTree' })

-- setup mapping to call :LazyGit
keymap.set('n', '<space>gg', ':LazyGit<cr>', { desc = 'LazyGit' })

-- load ai
-- keymap.set({ 'n', 'v' }, '<space>i', ':Gen<Return>')
