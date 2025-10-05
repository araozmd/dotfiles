# Repository Guidelines

## Project Structure & Module Organization
Root directories map one-to-one with the managed applications so GNU Stow can symlink them cleanly. Place user-facing files inside `<tool>/.config/<tool>`; for example, Neovim lives in `nvim/.config/nvim`, Qtile in `qtile/.config/qtile`, and Alacritty in `alacritty/.config/alacritty/alacritty.yml`. Keep helper documentation beside its module (e.g., `tmux/TMUX_CHEATSHEET.md`) to prevent orphaned references when stowing.

## Build, Test, and Development Commands
Use `stow <module>` from the repository root to link a configuration into `$HOME`. Run `stow -D <module>` before restructuring files and `stow -R <module>` to refresh an existing link. After changing Lua plugins, execute `nvim --headless "+Lazy! sync" +qa`. Validate Qtile with `qtile check`, and reload tmux bindings in place with `tmux source-file ~/.tmux.conf`.

## Coding Style & Naming Conventions
Lua files use two-space indentation and align table assignments; Python follows four spaces. Keep directory names lowercase and choose descriptive module paths such as `settings/java.lua` or `widgets/battery.py`. Prefer `snake_case` for functions, mappings, and options, reserving `UPPER_SNAKE_CASE` for constants. Precede any non-obvious behavior with a brief inline comment.

## Testing Guidelines
After editing Lua modules, run `nvim --headless "+checkhealth" +qa` to surface plugin or health issues. For Qtile updates, pair `qtile check` with a nested launch (`qtile start -l WARNING`) when possible. Reapply terminal themes (`kitty +kitten themes`, relaunch Alacritty) and run `tmux source-file ~/.tmux.conf` to confirm colors, fonts, and keymaps resolve correctly.

## Commit & Pull Request Guidelines
Commit subjects begin with an emoji followed by a Title Case summary (for instance, `✨ Add New Statusline`). In the body, list affected modules and the validation commands you ran. Pull requests should enumerate touched modules, describe manual or automated verification, and attach screenshots for UI changes. Scope PRs narrowly; split unrelated tweaks into separate branches.

## Security & Configuration Tips
Never commit API keys or machine-specific secrets. Load sensitive values through environment variables or ignored files such as `nvim/.config/nvim/.claude/settings.local.json`. Keep machine-local secrets out of stowed directories so they remain unstowed by default.
