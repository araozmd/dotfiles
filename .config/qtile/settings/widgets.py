# Mauricio Damián https://github.com/araozmd/dotfiles
# Based on Antonio Sarosi config https://github.com/antoniosarosi/dotfiles

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

# Qtile widgets

from libqtile import widget
from .theme import colors

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }

def separator():
    return widget.Sep(**base(), linewidth=1, padding=5)

def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=65,
        padding=0
    )

def powerline_left(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text=" ", # Icon: nf-oct-triangle_right
        fontsize=65,
        padding=-25
    )

def workspaces(): 
    return [
        widget.Image(
            filename="~/.config/qtile/themes/arch-logo.png",
            background="#00000000",
        ),
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font Bold',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]

# This widgets are for the primary screen
primary_widgets = [

    *workspaces(),

    separator(),

    widget.Pomodoro(
        color_active=colors['focus'],
        color_break=colors['light'],
        font='Fire Code Nerd Font',
        prefix_inactive='   Pomodoro', # nf-pom-pomodoro_done
        prefix_active='   ', # nf-pom-pomodoro_ticking
    ),

    powerline('color4', 'dark'),

    icon(bg="color4", text=' '), # Icon: nf-fa-download

    widget.CheckUpdates(
        background=colors['color4'],
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
    ),

    powerline('color3', 'color4'),

    icon(bg="color3", text=' '),  # Icon: nf-fa-feed

    widget.Net(**base(bg='color3'), interface='wlp5s0'),

    powerline('color2', 'color3'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color1', 'color2'),

    icon(bg="color1", fontsize=17, text=' 󰃰 '),

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color1'),

    widget.Systray(background=colors['dark'], padding=5),
]

primary_widgets_bottom = [
    # Size of root partition
    widget.DF(
        **base(bg='color1'),
        visible_on_warn=False,
        format = '{p} ({uf} {m}|{r:.0f}%)'
    ),
    widget.HDDGraph(
        **base(bg='color1'),
    ),

    powerline_left('color1', 'color2'),

    # Size of home partition
    widget.DF(
        **base(bg='color2'),
        visible_on_warn=False,
        partition = '/home',
        format = '{p} ({uf} {m}|{r:.0f}%)'
    ),
    widget.HDDGraph(
        **base(bg='color2'),
        path = '/home',
    ),
    powerline_left('color2'),

    widget.Spacer(),

    # nvidia sensors
    powerline('color3', 'dark'),
    icon(bg="color3", fontsize=17, text='  '),
    widget.NvidiaSensors(
        **base(bg='color3'),
        gpu_bus_id='',
        format='{temp}°C,  {fan_speed}  {perf}',
        update_interval=10,
    ),

    # RAM usage
    powerline('color2', 'color3'),
    icon(bg="color2", fontsize=17, text='  '),
    widget.Memory(
        **base(bg='color2'),
        measure_mem="G",
        measure_swap="G",
        update_interval=10,
    ),

    # CPU usage
    powerline('color1', 'color2'),
    icon(bg="color1", fontsize=17, text='  '), # nf-oct-cpu
    widget.CPU(
        **base(bg='color1'),
        format='{freq_current}GHz, 󰝪: {load_percent} %,', # nf-md-chart_bar_stacked
        update_interval=10,
    ),
    icon(bg="color1", fontsize=17, text='  '), #nf-weather-thermometer
    widget.ThermalSensor(
        **base(bg='color1'),
        tag_sensor="Tctl",
        update_interval=10,
    ),
]

# This widgets are for the secondary screen
secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color2', 'dark'),

    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),

    widget.CurrentLayout(**base(bg='color2'), padding=5),

    powerline('color1', 'color2'),

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('color1', 'color1'),
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 15,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
