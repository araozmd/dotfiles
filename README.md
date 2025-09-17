# Config files for any Linux/Unix based system

## OS Information

This configuration is mainly for Arch Linux, but it should work on any 
Linux/Unix based system.

## Arch Linux Installation

1. Download the latest Arch Linux ISO from the [official website](https://www.archlinux.org/download/).
2. Create a bootable USB drive using [Rufus](https://rufus.ie/) or [Balena Etcher](https://www.balena.io/etcher/).
3. Boot into the live environment.
4. Follow the [official installation guide](https://wiki.archlinux.org/title/Installation_guide#Installation).

## Apps and Packages

1. [Xorg](https://www.x.org/wiki/) for the display server.
2. [Qtile](http://www.qtile.org/) for the window manager.
3. [kitty](https://sw.kovidgoyal.net/kitty/) and [Alacritty](https://alacritty.org/) for the terminal emulator.
4. [Zsh](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/) for the shell.
5. [Neovim](https://neovim.io/) for the text editor with AI integration.
6. [Yazi](https://github.com/sxyazi/yazi) for a powerful terminal file manager.
7. [gtk](https://www.gtk.org/) for the GUI toolkit.
8. [Deadd Notification Center](https://github.com/phuhl/linux_notification_center) for the notification center.

## Configuring Dotfiles

### Prerequisites

First, install GNU Stow, which is a symlink farm manager that creates symbolic links from your dotfiles to their target locations.

**Arch Linux:**
```bash
sudo pacman -S stow
```

**MacOS:**
```bash
brew install stow
```

**Ubuntu/Debian:**
```bash
sudo apt install stow
```

### Installation Guide

**Important:** For stow to work correctly, you need to clone this repository to your home directory (`$HOME`) or a subdirectory of it.

1. **Clone the repository to your home directory:**
   ```bash
   cd ~
   git clone https://github.com/araozmd/dotfiles
   cd dotfiles
   ```

2. **Install configurations using stow:**
   
   Each directory in this repository represents a different application configuration. Use stow to create symbolic links:

   ```bash
   # Essential configurations
   stow nvim        # Neovim editor configuration
   stow qtile       # Qtile window manager
   stow alacritty   # Alacritty terminal emulator
   stow tmux        # Terminal multiplexer
   
   # Optional configurations
   stow kitty       # Alternative terminal emulator
   stow yazi        # Terminal file manager
   stow deadd       # Notification center
   stow gtk2 gtk3   # GTK themes
   stow xconfig     # X11 configuration
   ```

3. **Verify installation:**
   ```bash
   # Check if symlinks were created correctly
   ls -la ~/.config/nvim
   ls -la ~/.config/qtile
   ```

## Neovim Configuration

### AI Integration Features
This Neovim configuration includes multiple AI assistants for enhanced development experience:

- **GitHub Copilot**: Inline code completions while typing
- **Avante.nvim**: Cursor-like AI chat interface for complex code editing
- **Claude Code**: Direct integration with Claude AI
- **Copilot Chat**: Interactive conversations with GitHub Copilot

### Key Bindings Quick Reference

**Leader key**: `<Space>`

#### Essential Commands
- `<Leader>w` - Save file
- `<Leader>q` - Quit
- `<Leader>nt` - Toggle file explorer
- `<Leader>ff` - Find files

#### AI Commands
- `<Leader>aa` - Ask Avante AI
- `<Leader>ac` - Open AI chat
- `<Leader>ae` - AI edit selection (visual mode)
- `<Leader>ct` - Toggle Claude Code
- `<Leader>cpc` - Toggle Copilot Chat

For complete keybinding reference, see: [`nvim/.config/nvim/KEYBINDINGS.md`](nvim/.config/nvim/KEYBINDINGS.md)

### AI Setup

#### For Work Environments (GitHub Copilot only)
```bash
# Authenticate Copilot in Neovim
:Copilot auth
```

#### For Personal Use (Additional AI providers)
```bash
# Set API keys for other providers
export ANTHROPIC_API_KEY="your-claude-key"
export OPENAI_API_KEY="your-openai-key"
```

### Managing Configurations

**Install a specific configuration:**
```bash
stow <package-name>
```

**Remove a configuration:**
```bash
stow -D <package-name>
```

**Reinstall a configuration:**
```bash
stow -R <package-name>
```

**Install all configurations at once:**
```bash
stow */
```

### Troubleshooting

If you encounter conflicts, stow will warn you. Common solutions:

1. **Remove existing config files:**
   ```bash
   rm ~/.config/nvim/init.lua  # Remove conflicting file
   stow nvim                   # Then stow again
   ```

2. **Use the adopt flag to incorporate existing files:**
   ```bash
   stow --adopt nvim  # Moves existing files into the stow directory
   ```

### Directory Structure

This repository uses the following structure that mirrors your home directory:
```
dotfiles/
├── nvim/.config/nvim/           # → ~/.config/nvim/
├── qtile/.config/qtile/         # → ~/.config/qtile/
├── alacritty/.config/alacritty/ # → ~/.config/alacritty/
├── tmux/.tmux.conf              # → ~/.tmux.conf
└── ...
```
