# Neovim Configuration Cheatsheet

## Leader Key
**Leader key**: `<Space>`

## Core Editor Commands

### File Operations
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>w` | Save file | Write current buffer |
| `<Leader>q` | Quit | Close current buffer/window |
| `<Leader>wq` | Save and quit | Write and close |

### Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `<C-h>` | Move left | Focus left window |
| `<C-j>` | Move down | Focus bottom window |
| `<C-k>` | Move up | Focus top window |
| `<C-l>` | Move right | Focus right window |
| `<Leader>>` | Increase width | Expand window horizontally |
| `<Leader><` | Decrease width | Shrink window horizontally |

### Splits
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>sv` | Vertical split | Split window vertically |
| `<Leader>sh` | Horizontal split | Split window horizontally |
| `<Leader>se` | Equal splits | Make all splits equal size |
| `<Leader>sx` | Close split | Close current split |

### Buffer Management
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>bd` | Delete buffer | Close current buffer |
| `<Leader>bn` | Next buffer | Switch to next buffer |
| `<Leader>bp` | Previous buffer | Switch to previous buffer |
| `<Leader>ba` | Delete all buffers | Close all open buffers |

### Diagnostics
| Key | Action | Description |
|-----|--------|-------------|
| `[d` | Previous diagnostic | Go to previous error/warning |
| `]d` | Next diagnostic | Go to next error/warning |
| `<Leader>e` | Show diagnostic | Display error details in float |
| `<Leader>dl` | Diagnostic list | Open quickfix list with diagnostics |

## Plugin Commands

### File Explorer (Neo-tree)
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>nt` | Toggle tree | Open/close file explorer |

### Telescope (File Finder)
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>ff` | Find files | Search for files in project |
| `<Leader>fg` | Live grep | Search content across files |
| `<Leader>fb` | Find buffers | List and switch between open buffers |
| `<Leader>fh` | Help tags | Search help documentation |

### LSP (Language Server Protocol)
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>K` | Hover info | Show documentation for symbol under cursor |
| `gd` | Go to definition | Jump to symbol definition |
| `gD` | Go to declaration | Jump to symbol declaration |
| `gr` | References | Show all references to symbol |
| `gi` | Go to implementation | Jump to implementation |
| `<Leader>ca` | Code actions | Show available code actions |
| `<Leader>rn` | Rename | Rename symbol across project |

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>gg` | Git status | Open git status (if configured) |
| `<Leader>gb` | Git blame | Show git blame for current line |
| `<Leader>gd` | Git diff | Show git diff for current file |

## AI Assistant Commands

### Avante (AI Chat) - `<Leader>a*`
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>aa` | Ask Avante | Ask AI about code (normal/visual) |
| `<Leader>ac` | Chat | Open AI chat interface |
| `<Leader>ae` | Edit selection | AI edit selected code (visual mode) |
| `<Leader>at` | Toggle sidebar | Show/hide Avante sidebar |
| `<Leader>af` | Focus sidebar | Switch focus to Avante sidebar |
| `<Leader>ar` | Refresh | Refresh Avante interface |
| `<Leader>an` | New chat | Start new chat session |
| `<Leader>ah` | Chat history | Browse previous chat sessions |
| `<Leader>as` | Stop AI request | Cancel current AI operation |
| `<Leader>am` | Show models | List available AI models |
| `<Leader>ab` | Build dependencies | Build Avante dependencies |
| `<Leader>ap` | Switch provider | Change AI provider (OpenAI/Claude/Copilot) |
| `<Leader>aR` | Show repo map | Display project structure |
| `<Leader>aX` | Clear chat | Clear current chat history |

### Claude Code - `<Leader>c*`
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>ct` | Toggle Claude | Open/close Claude Code interface |
| `<Leader>cf` | Focus Claude | Switch focus to Claude Code |
| `<Leader>cr` | Resume Claude | Resume previous Claude session |
| `<Leader>cC` | Continue Claude | Continue with Claude |
| `<Leader>cb` | Add buffer | Add current buffer to Claude context |
| `<Leader>cs` | Send to Claude | Send selection to Claude (visual mode) |
| `<Leader>cA` | Accept diff | Accept Claude's suggested changes |
| `<Leader>cD` | Deny diff | Reject Claude's suggested changes |
| `<Leader>cg` | Generate annotations | Generate code annotations (Neogen) |

### Copilot Chat - `<Leader>cp*`
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>cpc` | Toggle chat | Open/close Copilot Chat |
| `<Leader>cpe` | Explain code | Ask Copilot to explain selected code |
| `<Leader>cpf` | Fix problem | Ask Copilot to fix issues in code |
| `<Leader>cpo` | Optimize code | Ask Copilot to optimize selected code |
| `<Leader>cpr` | Review code | Ask Copilot to review selected code |
| `<Leader>cpd` | Add docs | Generate documentation for code |
| `<Leader>cpm` | Commit message | Generate git commit message |
| `<Leader>cpq` | Quick chat | Quick chat with Copilot |

### Copilot Inline Suggestions
| Key | Action | Description |
|-----|--------|-------------|
| `<M-l>` | Accept suggestion | Accept Copilot inline suggestion |
| `<M-]>` | Next suggestion | Show next Copilot suggestion |
| `<M-[>` | Previous suggestion | Show previous Copilot suggestion |
| `<C-]>` | Dismiss | Dismiss current Copilot suggestion |
| `<M-CR>` | Open panel | Open Copilot suggestions panel |

## Avante Sidebar Commands

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
| `<S-Tab>` | Reverse switch | Reverse window switching |
| `d` | Remove file | Remove file from context |
| `@` | Add file | Add file to context |
| `q` | Close sidebar | Close Avante sidebar |

## Avante Diff Management

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

## Terminal Integration

### Tmux (if installed)
| Key | Action | Description |
|-----|--------|-------------|
| `<C-f>` | Tmux integration | Various tmux navigation commands |

## Markdown Preview
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>mp` | Preview markdown | Open markdown preview in browser |

## Testing
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>tn` | Test nearest | Run test under cursor |
| `<Leader>tf` | Test file | Run all tests in current file |
| `<Leader>ts` | Test suite | Run entire test suite |
| `<Leader>tl` | Test last | Run last test |

## Plugin Management (Lazy.nvim)
| Key | Action | Description |
|-----|--------|-------------|
| `:Lazy` | Open Lazy | Open plugin manager interface |
| `:Lazy sync` | Sync plugins | Update and install plugins |
| `:Lazy clean` | Clean plugins | Remove unused plugins |

## Mason (LSP Management)
| Key | Action | Description |
|-----|--------|-------------|
| `:Mason` | Open Mason | Open LSP/tool installer |
| `:MasonUpdate` | Update tools | Update installed tools |

## Tips

### AI Provider Switching
- **Work Environment**: Use `provider = "copilot"` in Avante config
- **Personal Use**: Switch to `provider = "claude"` or `provider = "openai"`
- Use `<Leader>ap` to switch providers on the fly

### Workflow Recommendations
1. **Code Completion**: Use Copilot inline suggestions (`<M-l>`)
2. **Code Explanation**: Use Copilot Chat (`<Leader>cpe`)
3. **Complex Editing**: Use Avante (`<Leader>aa` or `<Leader>ae`)
4. **Code Review**: Use Claude Code (`<Leader>cs`)

### Environment Variables
Set these in your shell for AI providers:

```bash
# For Copilot (work)
# Already authenticated via :Copilot auth

# For Claude (personal)
export ANTHROPIC_API_KEY="your-claude-key"

# For OpenAI (alternative)
export OPENAI_API_KEY="your-openai-key"
```

## Configuration Files
- **Main config**: `~/.config/nvim/init.lua`
- **Key mappings**: `~/.config/nvim/lua/settings/maps.lua`
- **Plugins**: `~/.config/nvim/lua/plugins/`
- **LSP config**: `~/.config/nvim/lua/plugins/lsp-config.lua`
- **AI config**: `~/.config/nvim/lua/plugins/avante.lua`