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
keymap.set('n', '<space>nt', ':Neotree toggle <cr>', { desc = 'Toggle NeoTree' })

-- setup mapping to call :LazyGit
keymap.set('n', '<space>gg', ':LazyGit<cr>', { desc = 'LazyGit' })

-- tabs
keymap.set('n', '<space>1', '1gt', { desc = 'Go to tab 1' })
keymap.set('n', '<space>2', '2gt', { desc = 'Go to tab 2' })
keymap.set('n', '<space>3', '3gt', { desc = 'Go to tab 3' })
keymap.set('n', '<space>0', ':tablast<cr>', { desc = 'Go to previous tab' })

-- Auto update packages
local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- TODO: allow running this headless (see mason updates)
vim.api.nvim_create_autocmd('VimEnter', {
  group = augroup 'autoupdate',
  callback = function()
    if require('lazy.status').has_updates then
      require('lazy').update { show = false }
    end
  end,
})

vim.opt.termguicolors = true

-- Mason Updates
-- nvim --headless -c "autocmd User MasonUpgradeComplete sleep 100m | qall" -c 'MasonUpgrade'
vim.api.nvim_create_user_command('MasonUpgrade', function()
  local registry = require 'mason-registry'
  registry.refresh()
  registry.update()
  local packages = registry.get_all_packages()
  for _, pkg in ipairs(packages) do
    if pkg:is_installed() then
      pkg:install()
    end
  end
  vim.cmd 'doautocmd User MasonUpgradeComplete'
end, { force = true })
