-- Key mappings
-- Author: Mauricio Damian

local g = vim.g
local map = vim.keymap

g.mapleader=" " -- set leader key to space

-- Save and quit
map.set('n', '<Leader>w', ':w<CR>', { desc = 'Save file' })
map.set('n', '<Leader>q', ':q<CR>', { desc = 'Quit' })
map.set('n', '<Leader>wq', ':wq<CR>', { desc = 'Save and quit' })

-- Split resizing
map.set('n', '<Leader>>', '10<C-w>>', { desc = 'Increase window width' })
map.set('n', '<Leader><', '10<C-w><', { desc = 'Decrease window width' })

-- LSP diagnostics navigation
map.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
map.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
map.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
map.set('n', '<Leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })

-- Buffer management
map.set('n', '<Leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })
map.set('n', '<Leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
map.set('n', '<Leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
map.set('n', '<Leader>ba', ':bufdo bd<CR>', { desc = 'Delete all buffers' })

-- Window navigation improvements
map.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
map.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
map.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
map.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- Split management
map.set('n', '<Leader>sv', ':vsplit<CR>', { desc = 'Split vertically' })
map.set('n', '<Leader>sh', ':split<CR>', { desc = 'Split horizontally' })
map.set('n', '<Leader>se', '<C-w>=', { desc = 'Make splits equal' })
map.set('n', '<Leader>sx', ':close<CR>', { desc = 'Close current split' })
