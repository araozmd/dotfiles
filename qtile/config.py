# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch focus of monitors
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Menu
    Key([mod], "m", lazy.spawn("rofi -show drun")),

    # Browser
    Key([mod], "b", lazy.spawn("google-chrome-stable")),

    # File explorer
    Key([mod], "e", lazy.spawn("thunar")),

    # Window Nav
    Key([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Lock the screen
    Key([mod], "o", lazy.spawn("light-locker-command -l")),

    # Screenshot
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),

    # Redshift for temperature of monitor
    Key([mod], "r", lazy.spawn("redshift -O 3200")),
    Key([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Volume
    Key([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    Key([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

groups = [Group(i) for i in ["   ", "   ", "   ", "   ", "   " ,"   "]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

layout_conf = {
    'border_focus': '#F07178',
    'border_width': 1,
    'margin': 4
}

layouts = [
    # layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.MonadTall(**layout_conf),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadWide(**layout_conf),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='UbuntuMono Nerd Font Bold',
    fontsize=16,
    padding=6,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    foreground=["#f1ffff", "#f1ffff"],
                    background=["#0f101a", "#0f101a"],
                    font='UbuntuMono Nerd Font',
                    fontsize=16,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=6,
                    borderwidth=1,
                    active=["#f1ffff", "#f1ffff"],
                    inactive=["#f1ffff", "#f1ffff"],
                    rounded=False,
                    highlight_method='block',
                    urgent_alert_method='block',
                    urgent_border=['#F07178'],
                    this_current_screen_border=["#f07178", "#f07178"],
                    this_screen_border=['#353c4a', '#353c4a'],
                    other_current_screen_border=['#0f101a', '#0f101a'],
                    other_screen_border=['#0f101a', '#0f101a'],
                    disable_drag=True
                ),
                widget.WindowName(
                    foreground=["#f07178", "#f07178"],
                    background=['#0f101a', '#0f101a'],
                ),
                widget.TextBox(
                    background=["#000000", "#000000"],
                    foreground=['#ffd47e', '#ffd47e'],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.TextBox(
                    background=['#ffd47e', '#ffd47e'],
                    foreground=["#0f101a", "#0f101a"],
                    text=" "
                ),
                widget.CheckUpdates(
                    background=['#ffd47e', '#ffd47e'],
                    colour_have_updates=["#0f101a", "#0f101a"],
                    colour_no_updates=["#0f101a", "#0f101a"],
                    no_update_string='0',
                    display_format='{updates}',
                    update_interval=1800,
                    custom_command='checkupdates',
                ),
                widget.TextBox(
                    background=['#ffd47e', '#ffd47e'],
                    foreground=['#fb9f7f', '#fb9f7f'],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.TextBox(
                    background=['#fb9f7f', '#fb9f7f'],
                    foreground=["#ffffff", "#ffffff"],
                    text=" "
                ),
                widget.Net(
                    background=["#fb9f7f", "#fb9f7f"],
                    interface="wlp5s0"
                ),
                widget.TextBox(
                    background=["#fb9f7f", "#fb9f7f"],
                    foreground=["#f07178", "#f07178"],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.CurrentLayoutIcon(
                    scale=0.65,
                    foreground=["#0f101a", "#0f101a"],
                    background=["#f07178", "#f07178"]
                ),
                widget.CurrentLayout(
                    foreground=["#0f101a", "#0f101a"],
                    background=["#f07178", "#f07178"]
                ),
                widget.TextBox(
                    background=["#f07178", "#f07178"],
                    foreground=["#a141d3", "#a141d3"],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.Sep(
                    linewidth=0,
                    padding=5,
                    background=["#a141d3", "#a141d3"]
                ),
                widget.TextBox(
                    background=["#a141d3", "#a141d3"],
                    foreground=["#0f101a", "#0f101a"],
                    text=' '
                ),
                widget.Clock(
                    background=["#a141d3", "#a141d3"],
                    foreground=["#0f101a", "#0f101a"],
                    format='%d/%m/%Y - %H:%M '
                ),
                widget.TextBox(
                    background=["#a141d3", "#a141d3"],
                    foreground=["#000000", "#000000"],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.Systray()
            ],
            30,
            opacity=0.95,
        ),
        bottom=bar.Bar(
            [
                widget.DF(
                    visible_on_warn=False,
                    background=['#e9c46a', '#e9c46a'],
                    foreground=['#000000', '#000000']
                ),
                widget.HDDGraph(
                    background=['#e9c46a', '#e9c46a'],
                    foreground=['#000000', '#000000']
                ),
               widget.TextBox(
                    text="",
                    fontsize=56,
                    padding=-3,
                    background=['#2a9d8f', '#2a9d8f'],
                    foreground=['#e9c46a', '#e9c46a']
                ),
                widget.DF(
                    partition="/home",
                    visible_on_warn=False,
                    background=['#2a9d8f', '#2a9d8f'],
                    foreground=['#ffffff', '#ffffff']
                ),
                widget.HDDGraph(
                    path="/home",
                    fill_color="ffffff",
                    border_color="ffffff",
                    graph_color="ffffff",
                    background=['#2a9d8f', '#2a9d8f'],
                    foreground=['#ffffff', '#ffffff']
                ),
               widget.TextBox(
                    text="",
                    fontsize=56,
                    padding=-3,
                    background=["#000000", "#000000"],
                    foreground=['#2a9d8f', '#2a9d8f']
                ),
                widget.Spacer(),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=-4,
                    foreground=['#264653', '#264653']
                ),
                widget.TextBox(
                    text=" ",
                    background=['#264653', '#264653'],
                    foreground=['#ffffff', '#ffffff']
                ),
                widget.NvidiaSensors(
                    gpu_bus_id='',
                    format='{temp}°C,  {fan_speed}  {perf}',
                    update_interval=10,
                    background=['#264653', '#264653'],
                    foreground=['#ffffff', '#ffffff']
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=-4,
                    foreground=['#2a9d8f', '#2a9d8f'],
                    background=['#264653', '#264653']
                ),
                widget.TextBox(
                    text="",
                    background=['#2a9d8f', '#2a9d8f'],
                    foreground=['#ffffff', '#ffffff']
                ),
                widget.Memory(
                    measure_mem="G",
                    measure_swap="G",
                    update_interval=10,
                    background=['#2a9d8f', '#2a9d8f'],
                    foreground=['#ffffff', '#ffffff']
                ),
                widget.Sep(
                    linewidth=0,
                    padding=5,
                    background=['#2a9d8f', '#2a9d8f']
                ),
                widget.TextBox(
                    text="",
                    fontsize=45,
                    padding=-4,
                    background=['#2a9d8f', '#2a9d8f'],
                    foreground=['#e9c46a', '#e9c46a']
                ),
                widget.TextBox(
                    text="﬙ ",
                    background=['#e9c46a', '#e9c46a'],
                    foreground=['#000000', '#000000']
                ),
                widget.CPU(
                    format='{freq_current}GHz {load_percent}%',
                    update_interval=10,
                    background=['#e9c46a', '#e9c46a'],
                    foreground=['#000000', '#000000']
                ),
                widget.ThermalSensor(
                    tag_sensor="Tctl",
                    update_interval=10,
                    background=['#e9c46a', '#e9c46a'],
                    foreground=['#000000', '#000000']
                )
            ],
            30,
            opacity=0.9
        )
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    foreground=["#f1ffff", "#f1ffff"],
                    background=["#0f101a", "#0f101a"],
                    font='UbuntuMono Nerd Font',
                    fontsize=16,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=6,
                    borderwidth=1,
                    active=["#f1ffff", "#f1ffff"],
                    inactive=["#f1ffff", "#f1ffff"],
                    rounded=False,
                    highlight_method='block',
                    urgent_alert_method='block',
                    urgent_border=['#F07178'],
                    this_current_screen_border=["#f07178", "#f07178"],
                    this_screen_border=['#353c4a', '#353c4a'],
                    other_current_screen_border=['#0f101a', '#0f101a'],
                    other_screen_border=['#0f101a', '#0f101a'],
                    disable_drag=True
                ),
                widget.WindowName(
                    foreground=["#f07178", "#f07178"],
                    background=['#0f101a', '#0f101a'],
                    fontsize=16,
                    font='UbuntuMono Nerd Font Bold',
                ),
                widget.TextBox(
                    background=["#000000", "#000000"],
                    foreground=["#f07178", "#f07178"],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.CurrentLayoutIcon(
                    scale=0.65,
                    foreground=["#0f101a", "#0f101a"],
                    background=["#f07178", "#f07178"]
                ),
                widget.CurrentLayout(
                    foreground=["#0f101a", "#0f101a"],
                    background=["#f07178", "#f07178"]
                ),
                widget.TextBox(
                    background=["#f07178", "#f07178"],
                    foreground=["#a141d3", "#a141d3"],
                    text="",
                    fontsize=37,
                    padding=-3
                ),
                widget.Sep(
                    linewidth=0,
                    padding=5,
                    background=["#a141d3", "#a141d3"]
                ),
                widget.TextBox(
                    background=["#a141d3", "#a141d3"],
                    foreground=["#0f101a", "#0f101a"],
                    text=' '
                ),
                widget.Clock(
                    background=["#a141d3", "#a141d3"],
                    foreground=["#0f101a", "#0f101a"],
                    format='%d/%m/%Y - %H:%M '
                )
            ],
            28,
            opacity=0.95,
        ),
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
