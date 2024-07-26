# Mauricio Damián https://github.com/araozmd/dotfiles
# Based on Antonio Sarosi config https://github.com/antoniosarosi/dotfiles

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons: 
# nf-fa-chrome, 
# nf-md-discord, 
# nf-oct-mail, 
# nf-cod-code,
# nf-dev-git_merge,
# nf-md-youtube

# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.lazy import lazy
from .keys import mod, keys

groups = [Group(i) for i in [
    "   ", " 󰙯  ", "   ", "   ", "  ", "  ", "  "
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen(toggle=True)),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
