# Repository Guidelines

## Project Structure & Module Organization
- Root folders mirror each managed app so GNU Stow can symlink them cleanly; e.g. `nvim/.config/nvim` for Lua modules, `qtile/.config/qtile` for window manager packages, and `alacritty/.config/alacritty/alacritty.yml` for terminal styling.
- Keep helper docs beside their module (`tmux/TMUX_CHEATSHEET.md`, `qtile/settings/README.md` if added) to avoid dangling references when stowing.
- New tools should follow the same pattern: create `<tool>/.config/<tool>` and place all user-facing files inside so `stow <tool>` works without flags.

## Build, Test, and Development Commands
- `stow <module>` — symlink the selected configuration into `$HOME`; run from repository root.
- `stow -D <module>` — un-stow before restructuring files to prevent broken links.
- `stow -R <module>` — restow after edits to refresh existing links.
- `nvim --headless "+Lazy! sync" +qa` — install or update Neovim plugins when Lua files change.
- `qtile check` — lint the Qtile configuration for syntax and import errors before reloading the WM.
- `tmux source-file ~/.tmux.conf` — reload tmux bindings in-place while iterating on the config.

## Coding Style & Naming Conventions
- Lua uses two-space indentation with aligned table assignments; Python sticks to four spaces.
- Name modules descriptively (`settings/java.lua`, `widgets/battery.py`), keep directories lowercase, and prefer `snake_case` for options, mappings, and helper functions.
- Reserve `UPPER_SNAKE_CASE` for constants and document unusual behavior with a short comment directly above the block.

## Testing Guidelines
- After Lua edits, run `nvim --headless "+checkhealth" +qa` to surface plugin or health issues.
- For Qtile, execute `qtile check` and, when possible, validate in a nested session (`qtile start -l WARNING`).
- Reload terminal configs (`kitty +kitten themes`, `alacritty` relaunch) and `tmux source-file ~/.tmux.conf` to confirm keymaps, fonts, and colors resolve.

## Commit & Pull Request Guidelines
- Commit subjects typically start with an emoji plus Title Case summary (`✨ Add new Neovim statusline`).
- Keep commit bodies brief: list affected modules and note validation commands.
- Pull requests should enumerate touched modules, outline verification steps, and link related issues or screenshots for UI changes. Scope them narrowly; split unrelated tweaks into separate branches.

## Security & Configuration Tips
- Do not commit API keys or machine-specific secrets; load them via environment variables or ignored files such as `nvim/.config/nvim/.claude/settings.local.json`.
- Ensure secrets never live in stowed paths by default so they stay machine-local.
