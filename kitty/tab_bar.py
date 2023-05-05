# pyright: reportMissingImports=false
from datetime import datetime

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer, get_options
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    TabBarData,
    as_rgb,
    draw_title,
)
from kitty.utils import color_as_int

opts = get_options()
# --------------------------------------------------------------\
# black  |  red     green    blue     magenta  cyan     white   | color
# color0 |  color1  color2   color4   color5   color6   color7  | normal
# color8 |  color9  color10  color12  color13  color14  color15 | bright
# --------------------------------------------------------------/

icon_fg = as_rgb(color_as_int(opts.color9))
bat_text_color = as_rgb(color_as_int(opts.color15))
clock_color = as_rgb(color_as_int(opts.color12))
pink_color = as_rgb(0x8CAAEE)

ICON = "  "
PLUGGED_ICON = ""
UNPLUGGED_ICONS = {
    10: "",
    20: "",
    30: "",
    40: "",
    50: "",
    60: "",
    70: "",
    80: "",
    90: "",
    100: "",
}
UNPLUGGED_COLORS = {
    15: as_rgb(color_as_int(opts.color1)),
    16: as_rgb(color_as_int(opts.color15)),
}
PLUGGED_COLORS = {
    15: as_rgb(color_as_int(opts.color1)),
    16: as_rgb(color_as_int(opts.color6)),
    99: as_rgb(color_as_int(opts.color6)),
    100: as_rgb(color_as_int(opts.color2)),
}
RIGHT_MARGIN = 1
REFRESH_TIME = 15


def _draw_icon(draw_data: DrawData, screen: Screen, index: int) -> int:
    if index != 1:
        return 0

    fg, bg = screen.cursor.fg, screen.cursor.bg

    screen.cursor.fg = icon_fg
    screen.cursor.bg = as_rgb(color_as_int(draw_data.default_bg))
    screen.draw(ICON)

    screen.cursor.fg, screen.cursor.bg = fg, bg
    screen.cursor.x = len(ICON)

    return screen.cursor.x


def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
) -> int:
    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)

    draw_title(draw_data, screen, tab, index)

    trailing_spaces = min(max_title_length - 1, draw_data.trailing_spaces)
    max_title_length -= trailing_spaces

    extra = screen.cursor.x - before - max_title_length
    if extra > 0:
        screen.cursor.x -= extra + 1
        screen.draw("…")
    if trailing_spaces:
        screen.draw(" " * trailing_spaces)

    end = screen.cursor.x
    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = 0
    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.default_bg))
        screen.draw(draw_data.sep)
    screen.cursor.bg = 0
    return end


def _get_battery_cells() -> list:
    try:
        status: str = ""
        percent: int = 0

        with open("/sys/class/power_supply/BAT1/status", "r") as f:
            status = f.read()
        with open("/sys/class/power_supply/BAT1/capacity", "r") as f:
            percent = int(f.read())

        if status == "Charging\n":
            icon_color = as_rgb(color_as_int(opts.color10))
            icon = PLUGGED_ICON
        else:
            icon_color = pink_color
            icon = UNPLUGGED_ICONS[
                min(UNPLUGGED_ICONS.keys(), key=lambda x: abs(x - percent))
            ]
        percent_cell = (bat_text_color, str(percent) + "% ")
        icon_cell = (icon_color, icon + " ")
        return [
            icon_cell,
            percent_cell,
        ]
    except FileNotFoundError:
        return []


def _draw_right_status(screen: Screen, is_last: bool) -> int:
    if not is_last:
        return 0

    clock = datetime.now().strftime("%H:%M")

    # cells = _get_battery_cells()
    cells = []
    cells.append((clock_color, clock))
    right_status_length = sum(len(str(item[1])) for item in cells) + RIGHT_MARGIN

    screen.cursor.x = screen.columns - right_status_length

    screen.cursor.fg = 0
    for color, status in cells:
        screen.cursor.fg = color
        screen.draw(status)
    screen.cursor.bg = 0

    if screen.columns - screen.cursor.x > right_status_length:
        screen.cursor.x = screen.columns - right_status_length
    return screen.cursor.x


def _redraw_tab_bar(_):
    tm = get_boss().active_tab_manager
    if tm is not None:
        tm.mark_tab_bar_dirty()


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    add_timer(_redraw_tab_bar, REFRESH_TIME, True)
    # _draw_icon(draw_data, screen, index)
    _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
    )
    _draw_right_status(
        screen,
        is_last,
    )

    return screen.cursor.x
