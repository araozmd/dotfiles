# Mauricio Damián https://github.com/araozmd/dotfiles
# Based on Antonio Sarosi config https://github.com/antoniosarosi/dotfiles

# Qtile mouse configuration

from libqtile.config import Drag, Click
from libqtile.command import lazy
from .keys import mod


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position()
    ),
    Drag(
        [mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front())
]
