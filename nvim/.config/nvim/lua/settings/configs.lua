-- General Settings
-- Author: Mauricio Damian
-- General configuration for Neovim

local set = vim.o
local g = vim.g
local opt = vim.opt

set.number = true         -- show line numbers
set.mouse = "a"           -- enable mouse support
set.clipboard = "unnamed" -- copy/paste to system clipboard
set.syntax = "on"         -- enable syntax highlighting
set.colorcolumn = "80"    -- set color column to 80
set.showcmd = true        -- show command in status bar
set.ruler = true          -- show line and column number in status bar
set.cursorline = true     -- highlight current line
set.encoding = "utf-8"    -- set encoding to utf-8
set.showmatch = true      -- highlight matching parenthesis
set.ts = 2                -- set tab size to 2
set.expandtab = true      -- use spaces instead of tabs
set.sw = 2                -- set shift width to 2
set.relativenumber = true -- show relative line numbers
set.laststatus = 2        -- always show status bar
set.showmode = false      -- hide mode in status bar
set.termguicolors = true  -- enable true color suppor

-- Options
opt.splitright = true  -- split windows to the right

-- Configs for vim-gitgutter
g.gitgutter_sign_added = " "
g.gitgutter_sign_modified = " "
g.gitgutter_sign_removed = " "
g.gitgutter_sign_removed_first_line = " "
g.gitgutter_sign_removed_above_and_below = '󰹺 '
g.gitgutter_sign_modified_removed = ""
