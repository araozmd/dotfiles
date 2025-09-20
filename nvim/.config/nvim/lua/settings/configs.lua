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

-- Enhanced diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    prefix = "●", -- Could be '●', '▎', 'x', '■', etc.
    source = "always", -- Show source (e.g., "semgrep", "eslint")
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- Don't update diagnostics while typing
  severity_sort = true, -- Show errors before warnings
  float = {
    enabled = true,
    border = "rounded",
    source = "always", -- Show diagnostic source
    header = "",
    prefix = "",
    focusable = false,
  },
})
set.sw = 2                -- set shift width to 2
set.relativenumber = true -- show relative line numbers
set.laststatus = 2        -- always show status bar
set.showmode = false      -- hide mode in status bar
set.termguicolors = true  -- enable true color suppor

-- Options
opt.splitright = true  -- split windows to the right

-- Gitgutter signs with nerdfonts
g.gitgutter_sign_added = " "
g.gitgutter_sign_modified = " "
g.gitgutter_sign_removed = " "
g.gitgutter_sign_removed_first_line = " "
g.gitgutter_sign_removed_above_and_below = '󰹺 '
g.gitgutter_sign_modified_removed = ""

-- Performance and behavior settings
g.gitgutter_preview_win_floating = 1
g.gitgutter_max_signs = 500
g.gitgutter_sign_priority = 10

-- Auto-reload files when changed externally
set.autoread = true

-- Create autocmds for better file change detection and git status updates
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

