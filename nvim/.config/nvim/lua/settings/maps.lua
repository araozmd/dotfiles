-- Key mappings
-- Author: Mauricio Damian

local g = vim.g
local map = vim.keymap

g.mapleader=" " -- set leader key to space

-- Save and quit
map.set('n', '<Leader>w', ':w<CR>')
map.set('n', '<Leader>q', ':q<CR>')
map.set('n', '<Leader>wq', ':wq<CR>')

-- Split resizing
map.set('n', '<Leader>>', '10<C-w>>')
map.set('n', '<Leader><', '10<C-w><')
