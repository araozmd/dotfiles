# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration using the Lazy.nvim plugin manager. The configuration is organized into modular Lua files with a clear separation between core settings, plugin configurations, and keymaps.

## Architecture

### Core Structure
- `init.lua` - Main entry point that loads settings and plugin manager
- `lua/settings/` - Core Neovim settings and keymaps
  - `init.lua` - Loads configs and maps
  - `configs.lua` - General Neovim settings (line numbers, tabs, clipboard, etc.)
  - `maps.lua` - Key mappings with Space as leader key
- `lua/plug-manager/lazy.lua` - Lazy.nvim setup and configuration
- `lua/plugins/` - Individual plugin configurations

### Plugin Organization
Each plugin is configured in its own file in `lua/plugins/`:
- `lsp-config.lua` - LSP setup with lsp-zero, Mason, and language servers
- `completions.lua` - Autocompletion with nvim-cmp
- `themes.lua` - Color schemes (currently using Catppuccin Mocha)
- `fileExplorer.lua` - File explorer with Neo-tree
- `findFiles.lua` - File finding capabilities
- `git.lua` - Git integration
- `debugging.lua` - Debug adapter protocol setup
- `vim-test.lua` - Test running integration
- `ai.lua` - AI assistance plugins (Copilot, Claude Code)
- `markdown.lua` - Markdown preview and editing
- `dashboard.lua` - Start screen configuration
- `tmux.lua` - Tmux integration
- `typing.lua` - Auto-pairs and typing assistance
- `ide.lua` - IDE-like features
- `none-ls.lua` - Formatting and linting

### Key Features
- **Plugin Manager**: Lazy.nvim with lazy loading
- **LSP**: Full LSP support with Mason for language server management
- **File Explorer**: Neo-tree with git status integration
- **Theme**: Catppuccin Mocha color scheme
- **AI Integration**: GitHub Copilot and Claude Code support
- **Git Integration**: GitGutter for change indicators
- **Leader Key**: Space key for custom mappings

## Common Development Tasks

### Plugin Management
- Add new plugins by creating/editing files in `lua/plugins/`
- Plugin specifications follow Lazy.nvim format with dependencies and configurations
- Lock file `lazy-lock.json` tracks exact plugin versions

### Key Mappings
- Leader key: Space
- File explorer: `<Leader>nt` (toggle Neo-tree)
- LSP hover: `<Leader>K`
- Code actions: `<Leader>ca`
- Save: `<Leader>w`
- Quit: `<Leader>q`
- Window resizing: `<Leader>>` and `<Leader><`

### Configuration Updates
- Core settings: Edit `lua/settings/configs.lua`
- Key mappings: Edit `lua/settings/maps.lua`
- Plugin configurations: Edit respective files in `lua/plugins/`

### File Structure Conventions
- All Lua files use 2-space indentation
- Plugin configurations return a table/array for Lazy.nvim
- Settings use `vim.o`, `vim.g`, and `vim.opt` appropriately
- Key mappings use `vim.keymap.set()`