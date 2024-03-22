# Mauricio Damián https://github.com/araozmd/dotfiles
# Based on Antonio Sarosi config https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------------ Monigors configuration ------------------------------#
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # ------------------ Window configuration --------------------------------#
    # Switch between windows in current stack pane
    ([mod], "k", lazy.layout.up()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Organize windows
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),

    # Grow windows
    ([mod, "control"], "k", lazy.layout.grow()),
    ([mod, "control"], "j", lazy.layout.shrink()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Normalize and maximize windows
    ([mod, "control"], "n", lazy.layout.normalize()),
    ([mod, "control"], "m", lazy.layout.maximize()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Kill focused window
    ([mod], "w", lazy.window.kill()),

    # Restart Qtile and quit current session
    ([mod, "control"], "q", lazy.shutdown()),
    ([mod, "control"], "r", lazy.restart()),

    # Flip layout
    ([mod, "control"], "space", lazy.layout.flip()),

    # ------------------ Applications configuration --------------------------#
    # Open terminal
    ([mod], "Return", lazy.spawn("alacritty")),

    # Open application launcher
    ([mod], "m", lazy.spawn("rofi -show drun -show-icons")),
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Open file manager
    ([mod], "e", lazy.spawn("thunar")),

    # Open web browser
    ([mod], "b", lazy.spawn("google-chrome-stable")),

    # Activating/deactivating warm colors
    ([mod], "r", lazy.spawn("redshift -O 3500")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Lock screen
    ([mod], "o", lazy.spawn("light-locker-command -l")),

    #Screenshot
    ([mod, "shift"], "s", lazy.spawn("flameshot gui")),

    # ------------------- Harware manipulation -------------------------------#

    # Suspend
    ([mod, "control"], "s", lazy.spawn("systemctl suspend")),

    # Volume control
    ([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    ([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),

    # Brightness control
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
  ]
]
