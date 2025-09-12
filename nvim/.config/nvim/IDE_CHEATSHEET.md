# Neovim IDE Cheat Sheet

## 🚀 Quick Reference - Most Used Commands

### Essential Navigation
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<C-h/j/k/l>` | Navigate between windows |
| `<Space>ff` | Find files (Telescope) |
| `<Space>fg` | Live grep search |
| `<Space>fb` | Find buffers |
| `<Space>nt` | Toggle Neo-tree file explorer |

### File Management
| Key | Action |
|-----|--------|
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>wq` | Save and quit |
| `<Space>bd` | Delete buffer |
| `<Space>bn` | Next buffer |
| `<Space>bp` | Previous buffer |
| `<Space>ba` | Delete all buffers |

### Window/Split Management
| Key | Action |
|-----|--------|
| `<Space>sv` | Split vertically |
| `<Space>sh` | Split horizontally |
| `<Space>se` | Make splits equal |
| `<Space>sx` | Close current split |
| `<Space>>` | Increase window width |
| `<Space><` | Decrease window width |

---

## 🧪 Testing Commands

### vim-test Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>t` | `:TestNearest` | Run test nearest to cursor |
| `<Space>T` | `:TestFile` | Run all tests in current file |
| `<Space>l` | `:TestLast` | Run last test command |
| `<Space>g` | `:TestVisit` | Go to test file from source (or vice versa) |

### Neotest (Advanced Testing)
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>tt` | Run nearest test | Run single test at cursor position |
| `<Space>tf` | Run file tests | Run all tests in current file |
| `<Space>td` | Debug nearest test | Debug test with DAP |
| `<Space>ts` | Toggle test summary | Show/hide test summary panel |
| `<Space>to` | Show test output | Display test results output |

---

## 💻 LSP & Code Intelligence

### LSP Navigation
| Key | Action |
|-----|--------|
| `<Space>K` | Show hover documentation |
| `<Space>ca` | Show code actions |
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<Space>e` | Show diagnostic float |
| `<Space>dl` | Open diagnostic list |

### Formatting & Linting
| Key | Action |
|-----|--------|
| `<Space>gf` | Format code (via LSP) |
| `<Space>F` | Format buffer (Conform.nvim) |

---

## 🤖 AI Assistance

### GitHub Copilot
| Key | Mode | Action |
|-----|------|--------|
| `<M-l>` | Insert | Accept Copilot suggestion |
| `<M-]>` | Insert | Next suggestion |
| `<M-[>` | Insert | Previous suggestion |
| `<C-]>` | Insert | Dismiss suggestion |
| `<M-CR>` | Insert | Open suggestion panel |

### CopilotChat
| Key | Action |
|-----|--------|
| `<Space>cc` | Toggle Copilot Chat |
| `<Space>ce` | Explain code |
| `<Space>cf` | Fix problems |
| `<Space>co` | Optimize code |
| `<Space>ct` | Generate tests |
| `<Space>cd` | Add documentation |
| `<Space>cr` | Review code |
| `<Space>cm` | Generate commit message |
| `<Space>cq` | Quick chat |

### Claude Code
| Key | Action |
|-----|--------|
| `<Space>ac` | Toggle Claude |
| `<Space>af` | Focus Claude |
| `<Space>ar` | Resume Claude |
| `<Space>ab` | Add current buffer |
| `<Space>as` | Send to Claude (visual mode) |
| `<Space>aa` | Accept diff |
| `<Space>ad` | Deny diff |

---

## 🔍 Search & Find

### Telescope
| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep (search in files) |
| `<Space>fb` | Find buffers |
| `<Space>fh` | Find help tags |
| `<C-x>` | Open selection in horizontal split (in Telescope) |
| `<C-v>` | Open selection in vertical split (in Telescope) |
| `<C-t>` | Open selection in new tab (in Telescope) |

---

## 📝 Git Integration

### Fugitive
| Key | Action |
|-----|--------|
| `<Space>G` | Open Git status |
| `<Space>gp` | Git push |
| `<Space>gl` | Git pull |
| `<Space>gb` | Git blame |

### GitGutter
| Key | Action |
|-----|--------|
| `<Space>gn` | Next git hunk |
| `<Space>gP` | Previous git hunk |
| `<Space>gs` | Stage git hunk |
| `<Space>gu` | Undo git hunk |
| `<Space>gv` | Preview git hunk |

---

## 🐛 Debugging

### DAP (Debug Adapter Protocol)
| Key | Action |
|-----|--------|
| `<Space>dt` | Toggle breakpoint |
| `<Space>dc` | Continue debugging |
| `<F5>` | Continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |

---

## ✏️ Editing Enhancements

### Completion (nvim-cmp)
| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Insert | Trigger completion |
| `<CR>` | Insert | Confirm selection |
| `<C-e>` | Insert | Abort completion |
| `<C-b>` | Insert | Scroll docs up |
| `<C-f>` | Insert | Scroll docs down |
| `<Tab>` | Insert | Next item |
| `<S-Tab>` | Insert | Previous item |

### Auto-pairs
- `()`, `[]`, `{}`, `""`, `''` auto-close
- Type closing bracket to skip over

### Comments
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc` | Toggle comment (visual mode) |
| `gcap` | Comment a paragraph |

---

## 🎨 UI & Appearance

### Theme
- Current: Catppuccin Mocha
- Transparent background enabled

### Neo-tree File Explorer
| Key | Action (in Neo-tree) |
|-----|--------|
| `<CR>` | Open file/folder |
| `a` | Add file |
| `A` | Add directory |
| `d` | Delete |
| `r` | Rename |
| `y` | Copy |
| `x` | Cut |
| `p` | Paste |
| `c` | Copy to clipboard |
| `m` | Move |
| `R` | Refresh |
| `?` | Show help |
| `<` | Previous source |
| `>` | Next source |

---

## 📊 Status Line (Lualine)

From left to right:
- Mode indicator
- Git branch
- Git diff stats
- Diagnostics
- Filename
- Copilot status
- File encoding
- File format
- File type
- Progress in file
- Cursor position

---

## 🔧 Advanced Features

### Which-key
- Press any key sequence and wait - which-key will show available continuations
- `<Space>` and wait - see all leader mappings

### Trouble
- `:Trouble` - Show diagnostics in pretty list
- `:TroubleToggle` - Toggle trouble window

### Markdown Preview
- `:MarkdownPreview` - Preview in browser
- `:MarkdownPreviewStop` - Stop preview

---

## 💡 Productivity Tips

### Quick Testing Workflow
1. Write code
2. `<Space>t` - Run nearest test
3. `<Space>to` - Check output if failed
4. Fix code
5. `<Space>l` - Run last test again

### Efficient Debugging
1. `<Space>dt` - Set breakpoint
2. `<Space>td` - Debug nearest test
3. Use F-keys to step through
4. `<Space>dc` - Continue when done

### AI-Assisted Development
1. Write function signature
2. Let Copilot complete it (`<M-l>`)
3. `<Space>ct` - Generate tests
4. `<Space>t` - Run the test
5. `<Space>cd` - Add documentation
6. `<Space>cr` - Review for improvements

### Fast File Navigation
1. `<Space>nt` - Open file tree
2. `/` to search in tree
3. Or use `<Space>ff` for fuzzy finding
4. `<Space>fg` to search content

### Git Workflow
1. Make changes
2. `<Space>gv` - Preview changes
3. `<Space>gs` - Stage hunks
4. `<Space>cm` - Generate commit message
5. `<Space>gp` - Push changes

---

## 🎯 Common Workflows

### Creating New Feature
```
1. <Space>nt         # Open file tree
2. a                 # Create new file
3. <Space>ct         # Generate tests with Copilot
4. <Space>t          # Run test
5. <Space>cd         # Add documentation
6. <Space>gf         # Format code
7. <Space>w          # Save
```

### Refactoring Code
```
1. <Space>ff         # Find file
2. <Space>fg         # Search for function
3. V                 # Visual select
4. <Space>cR         # Copilot refactor
5. <Space>T          # Run file tests
6. <Space>cr         # Review changes
```

### Debugging Issue
```
1. <Space>dl         # See all diagnostics
2. ]d                # Next diagnostic
3. <Space>K          # Hover for info
4. <Space>ca         # Code actions
5. <Space>cf         # Copilot fix
6. <Space>l          # Run last test
```

---

## 📚 Resources

### Getting Help
- `:help <topic>` - Neovim help
- `<Space>fh` - Search help tags
- `:Lazy` - Plugin manager
- `:Mason` - LSP installer
- `:checkhealth` - Check setup

### Configuration Files
- `~/.config/nvim/init.lua` - Entry point
- `~/.config/nvim/lua/plugins/` - Plugin configs
- `~/.config/nvim/lua/settings/maps.lua` - Keymaps
- `~/.config/nvim/COPILOT_GUIDE.md` - Copilot details
- `~/.config/nvim/IDE_CHEATSHEET.md` - This file

---

## 🚨 Troubleshooting

### If Tests Don't Run
- Check test runner is installed (jest, pytest, etc.)
- Verify you're in a test file or near a test
- Try `<Space>T` for whole file
- Check `:messages` for errors

### If Copilot Stops Working
- Check status in lualine
- `:Copilot status`
- `:Copilot restart`
- Verify Node.js > 18

### If LSP Not Working
- `:LspInfo` - Check status
- `:Mason` - Install servers
- `:checkhealth lsp`

### If Completion Not Showing
- `<C-Space>` - Force trigger
- Check `:CmpStatus`
- Verify LSP is running

---

## 🎮 Pro Mode

### Multi-Cursor (with visual block)
1. `<C-v>` - Visual block mode
2. Select columns
3. `I` or `A` - Insert/Append
4. Type text
5. `<Esc>` - Apply to all

### Macros
1. `qa` - Record macro to 'a'
2. Perform actions
3. `q` - Stop recording
4. `@a` - Play macro
5. `@@` - Repeat last macro

### Marks
1. `ma` - Set mark 'a'
2. `'a` - Jump to mark 'a'
3. ``` ` ```a - Jump to exact position
4. `:marks` - List all marks

---

**Remember**: The more you use these commands, the more natural they become. Start with the essentials and gradually incorporate more advanced features into your workflow!