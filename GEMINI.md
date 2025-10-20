# Gemini Context: Dotfiles Repository

## Directory Overview

This directory is a dotfiles repository for configuring a Linux/Unix-based development environment. It is primarily designed for Arch Linux but is adaptable to other systems. The configurations are managed using `stow`, a symlink farm manager.

The repository contains configurations for a variety of tools, including:

*   **Window Manager:** Qtile
*   **Terminal Emulators:** Alacritty and Kitty
*   **Shell:** Zsh with Oh My Zsh
*   **Text Editor:** Neovim (with extensive AI integration)
*   **File Manager:** Yazi
*   **GUI Toolkit:** GTK
*   **Notification Center:** Deadd

## Key Files

*   `README.md`: Provides a comprehensive overview of the project, including installation instructions for Arch Linux, a list of configured applications, and a guide to using `stow` to manage the dotfiles.
*   `nvim/.config/nvim/init.lua`: The entry point for the Neovim configuration. It uses a modular structure, loading settings and plugins from the `lua/` directory.
*   `nvim/.config/nvim/lua/settings/configs.lua`: Contains the core Neovim settings, including options for line numbers, mouse support, clipboard integration, and syntax highlighting.
*   `qtile/.config/qtile/config.py`: The main configuration file for the Qtile window manager. It also follows a modular design, importing settings for keys, groups, layouts, and screens.
*   `qtile/.config/qtile/settings/screens.py`: Configures the screens and status bars in Qtile, including a dynamic setup for multiple monitors.

## Usage

The configurations in this repository are intended to be symlinked to the user's home directory using `stow`. The `README.md` file provides detailed instructions on how to do this.

For example, to install the Neovim configuration, you would run the following command from the root of the repository:

```bash
stow nvim
```

## Development Conventions

*   **Modularity:** The Neovim and Qtile configurations are highly modular, with settings, keybindings, and UI components separated into different files.
*   **Lua for Neovim:** The Neovim configuration is written in Lua, which is the modern standard for Neovim configuration.
*   **Python for Qtile:** The Qtile configuration is written in Python.
*   **AI Integration:** The Neovim setup is heavily customized with multiple AI assistant integrations, including GitHub Copilot, Avante.nvim, Claude Code, and Copilot Chat.
