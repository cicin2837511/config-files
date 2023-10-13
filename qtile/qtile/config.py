import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

mod = "mod1"
terminal = "alacritty"

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack",),
    Key([mod], "Return", lazy.spawn("emacsclient -c -a 'emacs'"), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window",),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn("rofi -show drun"), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "t", lazy.spawn("alacritty"))
]
groups = []
group_names = ["WWW","DEV","SYS","DOC","CHAT","VBOX","VID","MUS","GFX"]
keynames = [i for i in "123456789"]
#group_labels = ["WWW","DEV","SYS","DOC","CHAT","VBOX","VID","MUS","GFX"]
group_labels = ["  ","  ","  ","  ","  ","  ","  ","  ","  "]
for g in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[g],
            label=group_labels[g],
        )
    )
# mod + i, moves screen to groups[i]
# mod + shift + i, moves screen with active tab to groups[i]
for keyname, group in zip(keynames, groups):
    keys.extend([
        Key([mod], keyname, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], keyname, lazy.window.togroup(group.name)),
    ])
layouts = [
    layout.MonadTall(
        margin = 10,
        border_focus = '8839ef',
        border_normal = 'b4befe',
        border_width = 3
        ),
    layout.Max(),
]
colors = [["#181825"],
          ["#cdd6f4"],
          ["#449944"],
          ["#a6e3a1"],
          ["#b7f4b2"],
          ["#f5c2e7"],
          ["#f38ba8"],
          ["#cba6f7"],
          ["#b4befe"],
          ["#313244"]]

widget_defaults = dict(
    font="CaskaydiaCove Nerd Font",
    fontsize=15,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    background = colors[0],
                    highlight_method='block',
                    rounded = False,
                    this_current_screen_border = colors[2],
                    this_screen_border = colors[2],
                    other_screen_border = colors[9],
                    padding_y = 5,
                    padding_x = 5,
                    active = colors[7],
                    inactive = colors[2]
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=33,
                    background = colors[9],
                    padding=-1,
                    foreground = colors[0]
                    ),
                widget.WindowName(
                    background = colors[9],
                    foreground = colors[1],
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=43,
                    background = colors[9],
                    padding=-1,
                    foreground = colors[7]
                    ),
                widget.Clock(
                    format="%Y/%m/%d %I:%M %p",
                    background = colors[7],
                    foreground = colors[9]
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=43,
                    background = colors[7],
                    padding=-1,
                    foreground = colors[8]
                    ),
                widget.CurrentLayout(
                    background = colors[8],
                    foreground = colors[0]
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=43,
                    background = colors[8],
                    padding=-1,
                    foreground = colors[6]
                    ),
                widget.Systray(
                    background = colors[6],
                    padding = 10
                    ),
                widget.TextBox(
                        padding = 1,
                        background = colors[6]
                        ),
            ],
            30,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    background = colors[0],
                    highlight_method='block',
                    rounded = False,
                    this_current_screen_border = colors[2],
                    this_screen_border = colors[2],
                    other_screen_border = colors[9],
                    padding_y = 5,
                    padding_x = 5,
                    active = colors[7],
                    inactive = colors[2]
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=33,
                    background = colors[9],
                    padding=-1,
                    foreground = colors[0]
                    ),
                widget.WindowName(
                    background = colors[9],
                    foreground = colors[1],
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=43,
                    background = colors[9],
                    padding=-1,
                    foreground = colors[7]
                    ),
                widget.Clock(
                    format="%Y/%m/%d %I:%M %p",
                    background = colors[7],
                    foreground = colors[9]
                    ),
                widget.TextBox(
                    text="",
                    font='CaskaydiaCove Nerd Font',
                    fontsize=43,
                    background = colors[7],
                    padding=-1,
                    foreground = colors[8]
                    ),
                widget.CurrentLayout(
                    background = colors[8],
                    foreground = colors[0]
                    ),
                widget.TextBox(
                        padding = 1,
                        background = colors[8]
                        ),
            ],
            30,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
