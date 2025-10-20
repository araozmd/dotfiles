# Repository Guidelines

## Project Structure & Module Organization
This repo is a stow-friendly dotfiles bundle: each top-level directory mirrors a tool and is safe to symlink with `stow`. Place user-facing configuration under `<tool>/.config/<tool>`, e.g. `nvim/.config/nvim`, `qtile/.config/qtile`, `alacritty/.config/alacritty/alacritty.yml`. Keep auxiliary docs beside their module (like `tmux/TMUX_CHEATSHEET.md`) and avoid mixing machine-local secrets into stowed trees.

## Build, Test, and Development Commands
- `stow <module>` — link a module into `$HOME`; use `stow -D <module>` before restructuring and `stow -R <module>` after edits.
- `nvim --headless "+Lazy! sync" +qa` — sync Lua plugins whenever `nvim/lua` changes.
- `nvim --headless "+checkhealth" +qa` — surface plugin or health issues after edits.
- `qtile check` and `qtile start -l WARNING` — validate Qtile configs before deploying.
- `tmux source-file ~/.tmux.conf` — reload bindings and themes in-place.

## Coding Style & Naming Conventions
Lua files use two-space indents and aligned table assignments; Python follows four spaces. Favor descriptive, lowercase directory names and paths such as `settings/java.lua` or `widgets/battery.py`. Stick to `snake_case` for functions, mappings, and options, reserving `UPPER_SNAKE_CASE` for constants. Add succinct inline comments only when behavior is non-obvious.

## Testing Guidelines
Focus testing on runtime checks: run the headless Neovim health checks, Qtile validation, and reapply terminal themes (`kitty +kitten themes`, restart Alacritty) after theme edits. Confirm tmux keymaps with `tmux source-file ~/.tmux.conf`. There is no automated test harness, so document any manual verification in commit bodies.

## Commit & Pull Request Guidelines
Commits start with an emoji followed by a Title Case summary (e.g. `✨ Add New Statusline`). In the body, list touched modules and the validation commands executed. Pull requests should mirror that structure, link related issues, and include screenshots for UI-facing tweaks. Keep changes scoped to a single tool to maintain clean stow operations.

## Security & Configuration Tips
Never commit API keys or machine-local overrides. Load secrets through environment variables or ignored files like `nvim/.config/nvim/.claude/settings.local.json`. Keep per-machine adjustments outside the stowed directories so GNU Stow does not propagate private data.
