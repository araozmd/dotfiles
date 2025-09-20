# Neovim Complete Guide

## 📚 Table of Contents
- [🚀 Quick Start](#-quick-start)
- [⌨️ Essential Keybindings](#️-essential-keybindings)
- [🤖 AI Integration](#-ai-integration)
- [💻 LSP & Development](#-lsp--development)
- [📁 File Management](#-file-management)
- [🔀 Git Workflow](#-git-workflow)
- [🧪 Testing](#-testing)
- [🎨 UI & Interface](#-ui--interface)
- [🎯 Workflows](#-workflows)
- [🔧 Advanced Features](#-advanced-features)
- [🚨 Troubleshooting](#-troubleshooting)
- [⚡ Performance & Optimization](#-performance--optimization)

---

## 🚀 Quick Start

### Leader Key
**Leader key**: `<Space>` - All custom commands start with Space

### Most Used Commands
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>ff` | Find files | Search for files in project |
| `<Space>fg` | Live grep | Search content across files |
| `<Space>nt` | Toggle file tree | Open/close file explorer |
| `<Space>w` | Save file | Write current buffer |
| `<Space>q` | Quit | Close current buffer/window |
| `<C-h/j/k/l>` | Navigate windows | Move between split windows |

### First Time Setup
1. Open Neovim - should start quickly with optimized loading
2. Check `:Lazy` to see plugin loading status
3. Try essential commands: `<Space>ff`, `<Space>nt`, `<Space>cc`
4. Notice UI components load smoothly after startup

---

## ⌨️ Essential Keybindings

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>w` | Save file | Write current buffer |
| `<Space>q` | Quit | Close current buffer/window |
| `<Space>wq` | Save and quit | Write and close |

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Move left | Focus left window |
| `<C-j>` | Move down | Focus bottom window |
| `<C-k>` | Move up | Focus top window |
| `<C-l>` | Move right | Focus right window |
| `<Space>>` | Increase width | Expand window horizontally |
| `<Space><` | Decrease width | Shrink window horizontally |

### Splits
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>sv` | Vertical split | Split window vertically |
| `<Space>sh` | Horizontal split | Split window horizontally |
| `<Space>se` | Equal splits | Make all splits equal size |
| `<Space>sx` | Close split | Close current split |

### Buffer Management
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>bd` | Delete buffer | Close current buffer |
| `<Space>bn` | Next buffer | Switch to next buffer |
| `<Space>bp` | Previous buffer | Switch to previous buffer |
| `<Space>ba` | Delete all buffers | Close all open buffers |

---

## 🤖 AI Integration

### Avante (Primary AI Assistant) - `<Space>a*`
**Most comprehensive AI integration for complex coding tasks**

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>aa` | Ask Avante | Ask AI about code (normal/visual) |
| `<Space>ac` | Chat | Open AI chat interface |
| `<Space>ae` | Edit selection | AI edit selected code (visual mode) |
| `<Space>at` | Toggle sidebar | Show/hide Avante sidebar |
| `<Space>af` | Focus sidebar | Switch focus to Avante sidebar |
| `<Space>ar` | Refresh | Refresh Avante interface |
| `<Space>an` | New chat | Start new chat session |
| `<Space>ah` | Chat history | Browse previous chat sessions |
| `<Space>as` | Stop AI request | Cancel current AI operation |
| `<Space>am` | Show models | List available AI models |
| `<Space>ap` | Switch provider | Change AI provider (OpenAI/Claude/Copilot) |
| `<Space>aR` | Show repo map | Display project structure |
| `<Space>aX` | Clear chat | Clear current chat history |

#### Avante Sidebar Commands
When Avante sidebar is active:

| Key | Action | Description |
|-----|--------|-------------|
| `]p` | Next prompt | Navigate to next prompt in history |
| `[p` | Previous prompt | Navigate to previous prompt in history |
| `A` | Apply all | Apply all suggested changes |
| `a` | Apply cursor | Apply change at cursor |
| `r` | Retry request | Retry last AI request |
| `e` | Edit request | Edit the user request |
| `<Tab>` | Switch windows | Switch between windows |
| `d` | Remove file | Remove file from context |
| `@` | Add file | Add file to context |
| `q` | Close sidebar | Close Avante sidebar |

#### Avante Diff Management
When viewing AI-suggested changes:

| Key | Action | Description |
|-----|--------|-------------|
| `co` | Choose ours | Keep original code |
| `ct` | Choose theirs | Accept AI suggestion |
| `ca` | Choose all theirs | Accept all AI suggestions |
| `cb` | Choose both | Merge both versions |
| `cc` | Choose cursor | Choose change at cursor |
| `]x` | Next conflict | Go to next change |
| `[x` | Previous conflict | Go to previous change |

### Claude Code - `<Space>c*`
**Optimized for code review and complex analysis**

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>ct` | Toggle Claude | Open/close Claude Code interface |
| `<Space>cf` | Focus Claude | Switch focus to Claude Code |
| `<Space>cr` | Resume Claude | Resume previous Claude session |
| `<Space>cC` | Continue Claude | Continue with Claude |
| `<Space>cb` | Add buffer | Add current buffer to Claude context |
| `<Space>cs` | Send to Claude | Send selection to Claude (visual mode) |
| `<Space>cA` | Accept diff | Accept Claude's suggested changes |
| `<Space>cD` | Deny diff | Reject Claude's suggested changes |

### GitHub Copilot
**Real-time code completion and suggestions**

#### Inline Suggestions (Insert Mode)
| Key | Action | Description |
|-----|--------|-------------|
| `<M-l>` | Accept suggestion | Accept Copilot inline suggestion |
| `<M-]>` | Next suggestion | Show next Copilot suggestion |
| `<M-[>` | Previous suggestion | Show previous Copilot suggestion |
| `<C-]>` | Dismiss | Dismiss current Copilot suggestion |
| `<M-CR>` | Open panel | Open Copilot suggestions panel |

### CopilotChat - `<Space>cp*`
**Interactive AI conversations for code assistance**

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>cpc` | Toggle chat | Open/close Copilot Chat |
| `<Space>cpe` | Explain code | Ask Copilot to explain selected code |
| `<Space>cpf` | Fix problem | Ask Copilot to fix issues in code |
| `<Space>cpo` | Optimize code | Ask Copilot to optimize selected code |
| `<Space>cpr` | Review code | Ask Copilot to review selected code |
| `<Space>cpd` | Add docs | Generate documentation for code |
| `<Space>cpm` | Commit message | Generate git commit message |
| `<Space>cpq` | Quick chat | Quick chat with Copilot |

### AI Provider Recommendations
- **Work Environment**: Use `provider = "copilot"` in Avante config
- **Personal Use**: Switch to `provider = "claude"` or `provider = "openai"`
- **Complex Editing**: Use Avante (`<Space>aa` or `<Space>ae`)
- **Code Completion**: Use Copilot inline suggestions (`<M-l>`)
- **Code Explanation**: Use CopilotChat (`<Space>cpe`)
- **Code Review**: Use Claude Code (`<Space>cs`)

---

## 💻 LSP & Development

### LSP Navigation
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>K` | Hover info | Show documentation for symbol under cursor |
| `gd` | Go to definition | Jump to symbol definition |
| `gD` | Go to declaration | Jump to symbol declaration |
| `gr` | References | Show all references to symbol |
| `gi` | Go to implementation | Jump to implementation |
| `<Space>ca` | Code actions | Show available code actions |
| `<Space>rn` | Rename | Rename symbol across project |

### 🔍 Diagnostics & Code Issues
| Key | Action | Description |
|-----|--------|-------------|
| `[d` | Previous diagnostic | Jump to previous error/warning |
| `]d` | Next diagnostic | Jump to next error/warning |
| `<Space>e` | Show diagnostic float | **Shows full error details with source** |
| `<Space>dl` | Open diagnostic list | List all issues in quickfix window |

### 🛡️ Security Scanning (Semgrep)
- **Automatic**: Runs on Python, JS, TS, Go, Java, PHP, Ruby files
- **Visual indicators**: `●` markers with source info inline
- **Gutter signs**: `E`/`W`/`I` markers on left side
- **Real-time**: Scans as you type (250ms delay)
- **Severity**: Only shows ERROR-level security issues

### 📍 Understanding Gutter Signs
| Sign | Meaning | Color | Example Source |
|------|---------|-------|----------------|
| `E` | Error | 🔴 Red | semgrep, LSP, eslint |
| `W` | Warning | 🟡 Yellow | semgrep, LSP, eslint |
| `I` | Info | 🔵 Blue | LSP, prettier |
| `H` | Hint | ⚪ Gray | LSP suggestions |

**Pro Tip**: Use `<Space>e` on any line with a sign to see the full message!

### Formatting & Linting
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>gf` | Format code | Format via LSP |
| `<Space>F` | Format buffer | Format with Conform.nvim |
| `<Space>cg` | Generate annotations | Generate code annotations (Neogen) |

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

---

## 📁 File Management

### File Explorer (Neo-tree)
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>nt` | Toggle tree | Open/close file explorer |

#### In Neo-tree:
| Key | Action | Description |
|-----|--------|-------------|
| `<CR>` | Open file/folder | Open selected item |
| `a` | Add file | Create new file |
| `A` | Add directory | Create new directory |
| `d` | Delete | Delete selected item |
| `r` | Rename | Rename selected item |
| `y` | Copy | Copy to clipboard |
| `x` | Cut | Cut to clipboard |
| `p` | Paste | Paste from clipboard |
| `m` | Move | Move selected item |
| `R` | Refresh | Refresh tree |
| `?` | Show help | Display help |
| `<` | Previous source | Previous source |
| `>` | Next source | Next source |

### Telescope (File Finder)
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>ff` | Find files | Search for files in project |
| `<Space>fg` | Live grep | Search content across files |
| `<Space>fb` | Find buffers | List and switch between open buffers |
| `<Space>fh` | Help tags | Search help documentation |

#### In Telescope:
| Key | Action | Description |
|-----|--------|-------------|
| `<C-x>` | Horizontal split | Open selection in horizontal split |
| `<C-v>` | Vertical split | Open selection in vertical split |
| `<C-t>` | New tab | Open selection in new tab |

---

## 🔀 Git Workflow

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>G` | Git status | Open Git status (Fugitive) |
| `<Space>gp` | Git push | Push changes to remote |
| `<Space>gl` | Git pull | Pull changes from remote |
| `<Space>gb` | Git blame | Show git blame for current line |
| `<Space>gd` | Git diff | Show git diff for current file |

### GitGutter (Git Hunks)
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>gn` | Next git hunk | Jump to next change |
| `<Space>gP` | Previous git hunk | Jump to previous change |
| `<Space>gs` | Stage git hunk | Stage current hunk |
| `<Space>gu` | Undo git hunk | Undo current hunk |
| `<Space>gv` | Preview git hunk | Preview hunk changes |

### Git Workflow Example
```
1. Make changes
2. <Space>gv - Preview changes
3. <Space>gs - Stage hunks
4. <Space>cpm - Generate commit message (Copilot)
5. <Space>gp - Push changes
```

---

## 🧪 Testing

### vim-test Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>t` | Test nearest | Run test nearest to cursor |
| `<Space>T` | Test file | Run all tests in current file |
| `<Space>l` | Test last | Run last test command |
| `<Space>g` | Test visit | Go to test file from source (or vice versa) |

### Alternative Testing Commands
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>tn` | Test nearest | Run test under cursor |
| `<Space>tf` | Test file | Run all tests in current file |
| `<Space>ts` | Test suite | Run entire test suite |
| `<Space>tl` | Test last | Run last test |

### Quick Testing Workflow
```
1. Write code
2. <Space>t - Run nearest test
3. <Space>to - Check output if failed
4. Fix code
5. <Space>l - Run last test again
```

### ⚠️ Neotest Note
**Neotest was removed during optimization** to improve startup time. Use vim-test above for all testing needs. For advanced testing features, you can optionally re-enable neotest in the configuration.

---

## 🎨 UI & Interface

### Theme
- **Current**: Catppuccin Mocha
- **Transparent background**: Enabled

### Status Line (Lualine)
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

### Comments
| Key | Action | Description |
|-----|--------|-------------|
| `gcc` | Toggle line comment | Comment/uncomment current line |
| `gc` | Toggle comment | Comment/uncomment selection (visual mode) |
| `gcap` | Comment paragraph | Comment entire paragraph |

### Auto-pairs
- `()`, `[]`, `{}`, `""`, `''` auto-close
- Type closing bracket to skip over

### Markdown Preview
| Key/Command | Action | Description |
|-------------|--------|-------------|
| `<Space>mp` | Preview markdown | Open markdown preview in browser |
| `:MarkdownPreview` | Open preview | Open markdown preview in browser |
| `:MarkdownPreviewStop` | Stop preview | Stop the preview |
| `:MarkdownPreviewToggle` | Toggle preview | Toggle preview on/off |
| `:SwaggerPreview` | Preview Swagger | Preview Swagger/API documentation |
| `:SwaggerPreviewStop` | Stop Swagger | Stop Swagger preview |
| `:SwaggerPreviewToggle` | Toggle Swagger | Toggle Swagger preview |

---

## 🎯 Workflows

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

### AI-Assisted Development
```
1. Write function signature
2. Let Copilot complete it (<M-l>)
3. <Space>ct - Generate tests
4. <Space>t - Run the test
5. <Space>cd - Add documentation
6. <Space>cr - Review for improvements
```

### Fast File Navigation
```
1. <Space>nt - Open file tree
2. / to search in tree
3. Or use <Space>ff for fuzzy finding
4. <Space>fg to search content
```

### Diagnostic Workflow (Handling Warnings/Errors)
```
1. See gutter signs - E/W/I markers on left
2. Check details - <Space>e to see full message with source
3. Navigate issues - ]d / [d to jump between problems
4. Fix systematically - <Space>dl to see all issues in list
5. Verify fixes - Issues disappear automatically when resolved
```

---

## 🔧 Advanced Features

### Debugging (DAP)
| Key | Action | Description |
|-----|--------|-------------|
| `<Space>dt` | Toggle breakpoint | Set/remove breakpoint |
| `<Space>dc` | Continue debugging | Continue execution |
| `<F5>` | Continue | Continue debugging |
| `<F10>` | Step over | Step over current line |
| `<F11>` | Step into | Step into function |
| `<F12>` | Step out | Step out of function |

### Efficient Debugging
```
1. <Space>dt - Set breakpoint
2. <Space>td - Debug nearest test
3. Use F-keys to step through
4. <Space>dc - Continue when done
```

### Which-key
- Press any key sequence and wait - which-key will show available continuations
- `<Space>` and wait - see all leader mappings

### Trouble
- `:Trouble` - Show diagnostics in pretty list
- `:TroubleToggle` - Toggle trouble window

### Multi-Cursor (with visual block)
```
1. <C-v> - Visual block mode
2. Select columns
3. I or A - Insert/Append
4. Type text
5. <Esc> - Apply to all
```

### Macros
```
1. qa - Record macro to 'a'
2. Perform actions
3. q - Stop recording
4. @a - Play macro
5. @@ - Repeat last macro
```

### Marks
```
1. ma - Set mark 'a'
2. 'a - Jump to mark 'a'
3. `a - Jump to exact position
4. :marks - List all marks
```

---

## 🚨 Troubleshooting

### If Tests Don't Run
- Check test runner is installed (jest, pytest, etc.)
- Verify you're in a test file or near a test
- Try `<Space>T` for whole file
- Check `:messages` for errors
- **Note**: Advanced testing (neotest) was removed for performance

### If Copilot Stops Working
- Check status in lualine (shows Copilot icon)
- `:Copilot status`
- `:Copilot restart`
- Verify Node.js > 18
- Try `:Lazy reload copilot.lua` if using new optimized config

### If LSP Not Working
- `:LspInfo` - Check status
- `:Mason` - Install servers (now has explicit server list)
- `:checkhealth lsp`
- Check if server is in the explicit list in lsp-config.lua

### If Completion Not Showing
- `<C-Space>` - Force trigger
- Check `:CmpStatus`
- Verify LSP is running
- Copilot suggestions now integrate with completion menu

### If Diagnostics/Warnings Not Showing
- Check `:Mason` - ensure linters are installed (semgrep, etc.)
- Verify file type is supported (Python, JS, TS, Go, Java, PHP, Ruby)
- Try `:lua vim.diagnostic.show()` to force refresh
- Check `:messages` for any linter errors
- Semgrep may take a few seconds on first scan

### If Startup is Slow
- `:Lazy profile` - Check plugin loading times
- `:checkhealth lazy` - Verify lazy loading
- Most UI plugins now load with VeryLazy event
- Check `OPTIMIZATION_RESULTS.md` for performance details

### If Plugins Don't Load
- Check `:Lazy` for any errors
- UI plugins (lualine, colorizer) load after startup
- File explorer loads on first `<Space>nt` command
- Completion loads when entering insert mode

### If Avante Not Working
- Ensure you have valid API keys set in environment
- Check `:AvanteBuild` if having dependency issues
- Try `:AvanteRefresh` to restart the interface
- Check `:messages` for any error logs

---

## ⚡ Performance & Optimization

### Lazy Loading Status
- **Startup Plugins**: ~15 (essential only)
- **VeryLazy Plugins**: UI components load after startup
- **Command Plugins**: Load when you use them
- **Insert Mode**: Completion and Copilot load when typing

### Performance Monitoring
| Command | Purpose |
|---------|---------|
| `:Lazy` | View all plugins and loading status |
| `:Lazy profile` | See detailed loading times |
| `:checkhealth lazy` | Verify lazy loading setup |
| `nvim --startuptime startup.log +qall` | Measure startup time |

### Optimization Features
- **Modular Copilot**: Split from 446 to 140 lines
- **Smart Treesitter**: Only installs needed parsers
- **Explicit LSP**: Only loads servers you use
- **Lazy Dependencies**: Icons load only when needed
- **Event-Driven**: Plugins load based on what you're doing

### Expected Performance
- **Startup Time**: Under 50ms (vs ~100ms before)
- **Memory Usage**: 30-40% less at startup
- **Plugin Count**: 60% fewer plugins loading eagerly
- **User Experience**: Instant open, features load as needed

---

## 📚 Getting Help & Resources

### Getting Help
- `:help <topic>` - Neovim help
- `<Space>fh` - Search help tags
- `:Lazy` - Plugin manager
- `:Mason` - LSP installer
- `:checkhealth` - Check setup

### Plugin Management (Lazy.nvim)
| Command | Action | Description |
|---------|--------|-------------|
| `:Lazy` | Open Lazy | Open plugin manager interface |
| `:Lazy sync` | Sync plugins | Update and install plugins |
| `:Lazy clean` | Clean plugins | Remove unused plugins |

### Mason (LSP Management)
| Command | Action | Description |
|---------|--------|-------------|
| `:Mason` | Open Mason | Open LSP/tool installer |
| `:MasonUpdate` | Update tools | Update installed tools |

### Configuration Files
- **Main config**: `~/.config/nvim/init.lua`
- **Key mappings**: `~/.config/nvim/lua/settings/maps.lua`
- **Plugins**: `~/.config/nvim/lua/plugins/`
- **LSP config**: `~/.config/nvim/lua/plugins/lsp-config.lua`
- **AI config**: `~/.config/nvim/lua/plugins/avante.lua`

### Environment Variables for AI
Set these in your shell for AI providers:

```bash
# For Copilot (work)
# Already authenticated via :Copilot auth

# For Claude (personal)
export ANTHROPIC_API_KEY="your-claude-key"

# For OpenAI (alternative)
export OPENAI_API_KEY="your-openai-key"
```

---

## 💡 Productivity Tips

### Terminal Integration
- **Tmux**: Use `<C-f>` for various tmux navigation commands

### Quick Start After Optimization
1. Open Neovim - should start much faster now!
2. Check `:Lazy` to see optimized plugin loading
3. Try the essential commands: `<Space>ff`, `<Space>nt`, `<Space>cc`
4. Notice how UI components load smoothly after startup

### What Changed in Optimization
- **Faster Startup**: Most plugins now load when you need them
- **Same Features**: All functionality preserved, just more efficient
- **Better Experience**: Instant open, progressive feature loading
- **Cleaner Config**: Modular structure for easier maintenance

---

**Remember**: The more you use these commands, the more natural they become. Start with the essentials and gradually incorporate more advanced features into your workflow!

Your Neovim is optimized for speed while maintaining all the power! 🚀