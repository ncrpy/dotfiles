local wezterm = require("wezterm")

local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "pwsh.exe" }
else
  config.default_prog = { "/bin/zsh", "-l" }
end

config.skip_close_confirmation_for_processes_named = {
  "bash",
  "sh",
  "zsh",
  "fish",
  "tmux",
  "nu",
  "cmd.exe",
  "pwsh.exe",
  "powershell.exe",
  "wsl.exe",
  "wslhost.exe",
  "conhost.exe",
}

config.ssh_backend = "Ssh2"

config.font = wezterm.font_with_fallback({
  { family = "PlemolJP Console NF", weight = "Medium" },
})
config.font_size = 13.0
config.line_height = 1.2

config.use_ime = true

config.color_scheme = "Catppuccin Mocha"

local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

if scheme.tab_bar ~= nil then
  config.window_frame = {
    inactive_titlebar_bg = scheme.scrollbar_thumb,
    active_titlebar_bg = scheme.tab_bar.new_tab.bg_color,
    font_size = 11.0,
  }

  scheme.tab_bar.new_tab.bg_color = "none"
  config.colors = {
    tab_bar = scheme.tab_bar,
  }
else
  config.window_frame = {
    font_size = 11.0,
  }

  config.colors = {
    tab_bar = {
      new_tab = {
        bg_color = "none",
        fg_color = "#808080",
      },
      new_tab_hover = {
        bg_color = "1f1f1f",
        fg_color = "#c0c0c0",
      },
    },
  }
end

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.9

config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

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
    action = wezterm.action.PasteFrom("Clipboard"),
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
