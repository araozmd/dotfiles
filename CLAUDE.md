# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository for Linux/Unix systems, primarily targeting Arch Linux. The configuration uses GNU Stow for symlink management and includes configurations for a complete desktop environment with Qtile window manager, Neovim, terminal emulators, and various development tools.

## Architecture

### Stow-based Structure
Each application has its own directory that mirrors the target filesystem structure:
- `nvim/` - Neovim configuration using Lazy.nvim plugin manager
- `qtile/` - Qtile window manager with modular Python configuration
- `alacritty/` - Alacritty terminal emulator configuration
- `kitty/` - Kitty terminal emulator configuration
- `yazi/` - Yazi terminal file manager configuration
- `tmux/` - Tmux terminal multiplexer configuration
- `deadd/` - Deadd notification center configuration
- `gtk2/`, `gtk3/` - GTK theme configurations
- `xconfig/` - X11 configuration files

### Key Components
- **Window Manager**: Qtile with custom keybindings and layouts
- **Text Editor**: Neovim with comprehensive LSP, completion, and plugin setup
- **Terminal**: Alacritty and Kitty with custom color schemes
- **File Manager**: Yazi for terminal-based file navigation
- **Shell**: Configured for Zsh with Oh My Zsh

## Common Commands

### Installing/Managing Dotfiles
```bash
# Install GNU Stow
sudo pacman -S stow  # Arch Linux
brew install stow    # macOS

# Clone repository
git clone https://github.com/araozmd/dotfiles
cd dotfiles

# Install specific configurations
stow nvim     # Install Neovim config
stow qtile    # Install Qtile config
stow alacritty # Install Alacritty config
stow tmux     # Install tmux config
stow deadd    # Install notification center

# Remove configurations
stow -D nvim  # Remove Neovim config symlinks
```

### Qtile Configuration
- **Main config**: `qtile/.config/qtile/config.py`
- **Modular structure**: Settings split into `settings/` directory
- **Key bindings**: Mod key is Super/Windows key
- **Reload config**: Mod+Ctrl+r
- **Terminal**: Mod+Return
- **Launcher**: Mod+m

### Neovim Configuration
- **Plugin manager**: Lazy.nvim with lazy loading
- **Leader key**: Space
- **File explorer**: Space+nt (Neo-tree)
- **Find files**: Space+ff
- **LSP**: Comprehensive setup with Mason for language servers
- **Theme**: Catppuccin Mocha

### Terminal Configuration
- **Alacritty**: TOML-based configuration with custom color scheme
- **Kitty**: Alternative terminal with similar theming
- **Color scheme**: Custom colors optimized for development

## File Organization

### Neovim Structure
```
nvim/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── settings/           # Core settings and keymaps
│   ├── plug-manager/       # Lazy.nvim setup
│   └── plugins/           # Individual plugin configurations
└── ftplugin/              # Filetype-specific settings
```

### Qtile Structure
```
qtile/.config/qtile/
├── config.py              # Main configuration
└── settings/              # Modular settings
    ├── keys.py           # Keybindings
    ├── groups.py         # Workspaces
    ├── layouts.py        # Window layouts
    ├── screens.py        # Monitor setup
    ├── widgets.py        # Status bar widgets
    └── theme.py          # Colors and theming
```

## Development Workflow

### Making Changes
1. Edit configuration files directly in their respective directories
2. Test changes (Qtile: Mod+Ctrl+r to reload, Neovim: restart)
3. Commit changes to git repository

### Adding New Tools
1. Create new directory following Stow conventions
2. Place configuration files in proper subdirectory structure
3. Update README.md with stow command
4. Test with `stow <tool-name>`

### Key Design Principles
- **Modular**: Each tool/application in separate directory
- **Portable**: Works across Linux/Unix systems
- **Consistent**: Unified color schemes and key bindings
- **Documented**: Clear organization and naming conventions