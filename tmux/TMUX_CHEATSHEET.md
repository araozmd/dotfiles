# TMUX Cheatsheet

## Quick Reference

**Prefix Key**: `Ctrl-b` (default, unchanged in this config)

---

## 🔧 Core tmux Commands

### Sessions
| Command | Description |
|---------|-------------|
| `tmux new -s <name>` | Create new session with name |
| `tmux ls` | List all sessions |
| `tmux a -t <name>` | Attach to session |
| `tmux kill-session -t <name>` | Kill specific session |
| `prefix + s` | Interactive session list (with fzf) |
| `prefix + $` | Rename current session |
| `prefix + d` | Detach from session |

### Windows
| Command | Description |
|---------|-------------|
| `prefix + c` | Create new window (in current path) |
| `prefix + w` | Interactive window list (with fzf) |
| `prefix + ,` | Rename window |
| `prefix + &` | Kill window |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + 0-9` | Go to window number |
| `M-Left/Right` | Navigate windows (no prefix) |
| `C-S-Left/Right` | Move window left/right |

### Panes
| Command | Description |
|---------|-------------|
| `prefix + \|` | Split horizontally |
| `prefix + -` | Split vertically |
| `prefix + h/j/k/l` | Navigate panes (vim-style) |
| `prefix + H/J/K/L` | Resize panes |
| `prefix + x` | Kill pane |
| `prefix + z` | Toggle pane zoom |
| `prefix + {` | Move pane left |
| `prefix + }` | Move pane right |

---

## 🎯 Custom Keybindings (Your Config)

### Session Management
| Command | Description |
|---------|-------------|
| `prefix + S` | Create new session (prompt) |
| `prefix + K` | Kill current session (confirm) |
| `M-1` to `M-5` | Quick switch to window 1-5 |

### Configuration
| Command | Description |
|---------|-------------|
| `prefix + r` | Reload tmux config |

### Copy Mode (vim-style)
| Command | Description |
|---------|-------------|
| `prefix + Enter` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy to clipboard |
| `r` | Rectangle toggle |
| `Escape` | Cancel/exit |

---

## 🚀 Enhanced Plugin Features

### tmux-fzf (Fuzzy Finder)
| Command | Description |
|---------|-------------|
| `prefix + F` | Launch fzf menu |
| | Navigate sessions, windows, panes, commands |

### extrakto (Text Extraction)
| Command | Description |
|---------|-------------|
| `prefix + Tab` | Extract text from pane |
| | Select paths, URLs, git hashes with fzf |

### tmux-fpp (File Path Picker)
| Command | Description |
|---------|-------------|
| `prefix + f` | Launch file path picker |
| | Open files from command output |

### tmux-open (Smart Opening)
| Command | Description |
|---------|-------------|
| `o` (in copy mode) | Open highlighted file |
| `Ctrl-o` (in copy mode) | Open highlighted URL |
| `Shift-s` | Search highlighted text |

### tmux-yank (Enhanced Clipboard)
| Command | Description |
|---------|-------------|
| `y` (in copy mode) | Copy to system clipboard |
| Mouse selection | Auto-copy to clipboard |

---

## 🔄 Session Persistence

### tmux-resurrect + tmux-continuum
| Command | Description |
|---------|-------------|
| `prefix + Ctrl-s` | Save session manually |
| `prefix + Ctrl-r` | Restore session manually |
| Auto-save | Every 15 minutes |
| Auto-restore | On tmux start |

---

## 📋 Copy Mode Quick Reference

| Command | Description |
|---------|-------------|
| `prefix + [` | Enter copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `q` | Quit copy mode |
| `g` | Go to top |
| `G` | Go to bottom |
| `/` | Search down |
| `?` | Search up |
| `n` | Next search result |
| `N` | Previous search result |

---

## 🎨 Theme & Status Bar

- **Theme**: Catppuccin Mocha
- **Status Position**: Bottom
- **Update Interval**: 1 second
- **Activity Monitoring**: Enabled (visual off)

---

## 🔧 Installation & Plugin Management

### Install New Plugins
1. Add plugin line to `.tmux.conf`
2. Reload config: `prefix + r`
3. Install plugins: `prefix + I`

### Update Plugins
- `prefix + U`

### Remove Plugins
1. Remove plugin line from `.tmux.conf`
2. Reload config: `prefix + r`
3. Clean plugins: `prefix + alt + u`

---

## 💡 Pro Tips

1. **Mouse Support**: Enabled for scrolling, selecting, and resizing
2. **Vim Integration**: Seamless navigation between tmux panes and vim splits
3. **Performance**: Escape time reduced to 0 for better Neovim experience
4. **Persistence**: Sessions automatically saved and restored
5. **Fuzzy Finding**: Use `prefix + F` for quick navigation
6. **Text Extraction**: Use `prefix + Tab` to extract any text from terminal output

---

## 🛠 Troubleshooting

### Plugin Installation Issues
```bash
# Manual plugin installation
cd ~/.tmux/plugins/
git clone https://github.com/plugin-name/plugin-repo

# Reload tmux config
tmux source-file ~/.tmux.conf
```

### Reset tmux completely
```bash
tmux kill-server
tmux
```

### Check tmux version
```bash
tmux -V
```

---

*This cheatsheet covers the tmux configuration in `/Users/araozmd/dotfiles/tmux/.tmux.conf`*