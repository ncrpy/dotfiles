local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "pwsh.exe" }
else
  config.default_prog = { "/bin/zsh", "-l" }
end

config.font = wezterm.font_with_fallback({
  "PlemolJP Console NF",
})
config.font_size = 13.0

config.use_ime = true

config.color_scheme = "Catppuccin Mocha"

local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = scheme.background,
      fg_color = scheme.foreground,
    },
    new_tab_hover = {
      bg_color = "none",
      fg_color = scheme.foreground,
    },
  },
}

config.window_frame = {
  font_size = 11.0,
}

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.95

config.enable_scroll_bar = true

config.leader = { key = "/", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "C",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
  },
  {
    key = "V",
    mods = "CTRL|SHIFT",
    action = wezterm.action.PasteFrom("Clipboard")
  },
  {
    key = "s",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "v",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "r",
    mods = "LEADER",
    action = wezterm.action.RotatePanes("Clockwise"),
  },
  {
    key = "R",
    mods = "LEADER|SHIFT",
    action = wezterm.action.RotatePanes("CounterClockwise"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ShowLauncher,
  },
  {
    key = "t",
    mods = "LEADER",
    action = wezterm.action.ShowTabNavigator,
  },
}

return config
