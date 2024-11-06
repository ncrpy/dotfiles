local wezterm = require "wezterm"

return {
  default_prog = { '/bin/zsh', '-l' },
  font = wezterm.font_with_fallback({
    "PlemolJP Console NF",
  }),
  use_ime = true,
  font_size = 13.0,
  color_scheme = "Catppuccin Mocha",
  window_decorations = "INTEGRATED_BUTTONS | RESIZE",
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.9,
  enable_scroll_bar = true,
  leader = { key = '/', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = 's',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'v',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'c',
      mods = 'LEADER',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
      key = 'r',
      mods = 'LEADER',
      action = wezterm.action.RotatePanes 'Clockwise',
    },
    {
      key = 'R',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.RotatePanes 'CounterClockwise',
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action.ShowLauncher,
    },
    {
      key = 't',
      mods = 'LEADER',
      action = wezterm.action.ShowTabNavigator,
    },
  },
}
