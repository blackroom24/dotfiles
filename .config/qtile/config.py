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

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget

from typing import List  # noqa: F401

# key variables
mod = "mod4"
alt = "mod1"

# default apps
terminal = "alacritty"
launcher = "dmenu_run -p Run: "
browser = "chromium"
file_manager = "pcmanfm"

keys = [
    Key(
        [mod], "x",
        lazy.spawn(terminal),
        desc="Launches terminal"
    ),
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("volup"),
        desc="Volume Increase"
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("voldown"),
        desc="Volume Lower"
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("mute"),
        desc="Toggle Volume"
    ),
    Key(
        [mod], "r",
        lazy.spawn(launcher),
        desc="Launcher"
    ),
    Key(
        [mod], "b",
        lazy.spawn(browser),
        desc="Open Default Browser"
    ),
    Key(
        [mod], "e",
        lazy.spawn(file_manager),
        desc="Open Default File Manager"
    ),
    Key(
        [mod], "k",
        lazy.layout.down(),
        desc="Focus next by index"
    ),
    Key(
        [mod], "j",
        lazy.layout.up(),
        desc="Focus previous by index"
    ),
    Key(
        [mod, "control"], "k",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "control"], "j",
        lazy.layout.shuffle_up()
    ),
    Key(
        [alt], "Tab",
        lazy.layout.next(),
        desc="focus next client"
    ),
    Key(
        [mod, "shift"], "space",
        lazy.layout.rotate()
    ),
    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split()
    ),
    Key(
        [mod], "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle Fullscreen"
    ),
    Key(
        [mod], "space",
        lazy.next_layout(),
        desc="select next layout"
    ),
    Key(
        [mod], "q",
        lazy.window.kill(),
        desc="Kill focused client"
    ),
    Key(
        [mod, "control"], "r",
        lazy.restart(),
        desc="Restart qtile"
    ),
    Key(
        [mod, "control"], "q",
        lazy.shutdown(),
        desc="Quit Qtile session"
    ),

]


def get_group_names():
    return [
        ("1", {"layout": "monadtall"}),
        ("2", {"layout": "monadtall"}),
        ("3", {"layout": "monadtall"}),
        ("4", {"layout": "monadtall"}),
        ("5", {"layout": "monadtall"}),
        ("6", {"layout": "floating"}),
        ("7", {"layout": "monadtall"}),
        ("8", {"layout": "monadtall"}),
        ("9", {"layout": "floating"}),
    ]


def init_groups():
    return [Group(name, **kwargs) for name, kwargs in group_names]


if __name__ in ("config", "__main__"):
    group_names = get_group_names()
    groups = init_groups()

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))


layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus": "8fbcbb",
    "border_normal": "3b4252",
}

layouts = [
    layout.Floating(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(),
]


widget_defaults = dict(
    font="Mononoki Nerd Font", fontsize=14,
    padding=4, foreground="5e81ac", background="2e3440",

)
extension_defaults = widget_defaults.copy()


def init_widget_list():
    widget_list = [
        widget.GroupBox(
            active="5e81ac",
            inactive="b48ead",
            this_current_screen_border="bf616a",
            highlight_method="line",
            highlight_color=["2e3440", "2e3440"],
            center_aligned=True,
        ),
        widget.WindowName(),
        widget.Systray(),
        widget.TextBox(
            text=' VOL:',
            foreground="ebcb8b",
        ),
        widget.Volume(
            foreground="ebcb8b",
        ),
        widget.TextBox(
            text=' BAT:',
            foreground="5e81ac",
        ),
        widget.Battery(
            format='{percent:2.0%}'
        ),
        widget.TextBox(
            text=' wifi:',
            foreground="bf616a"
        ),
        widget.Wlan(
            interface="wlp3s0",
            foreground="bf6a6a",
            format='{essid} '
        ),
        widget.CurrentLayout(),
        widget.Clock(
            foreground="a3be8c",
            format=" %A, %B %d  [ %H:%M ]",),
    ]
    return widget_list


def init_bar():
    status_bar = bar.Bar(widgets=init_widget_list(),
                         size=24, background="2e3440")
    return status_bar


screens = [Screen(top=init_bar()), ]

# Drag floating layouts.
mouse = [
    Drag(
        [mod], "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click(
        [mod], "Button2",
        lazy.window.bring_to_front()
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop`
        # to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
