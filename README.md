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
5. [Neovim](https://neovim.io/) for the text editor.
6. [Yazi](https://github.com/sxyazi/yazi) for a powerful terminal file manager.
7. [gtk](https://www.gtk.org/) for the GUI toolkit.
8. [Deadd Notification Center](https://github.com/phuhl/linux_notification_center) for the notification center.

## Configuring Dotfiles

The first thing you need to install is GNU Stow. You can install it using the following command:

### Arch Linux

```bash
sudo pacman -S stow
```

### MacOS

````bash
brew install stow
````

GNU Stow is a symlink farm manager which takes distinct packages of software 
and/or data located in separate directories on the filesystem, and makes them 
appear to be installed in the same place.

### Cloning the Repository

```bash
git clone https://github.com/araozmd/dotfiles
cd dotfiles
```

### Stowing the Configurations

Configure the dotfiles that you need by using the following command:

```bash
stow nvim
stow qtile
stow tmux
```

If you're using Deadd Notification Center, you can also stow it:

```bash
stow deadd
```
