local wezterm = require("wezterm")

local version_date = wezterm.version:sub(1, 8)
local is_nightly = version_date > "20240203"

local config = wezterm.config_builder()

if is_nightly then
  config.ssh_backend = "Ssh2"
  config.mux_enable_ssh_agent = false
end

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

local domain_icons = {
  ubuntu = {
    char = wezterm.nerdfonts.linux_ubuntu,
    offset = 1,
  },
  debian = {
    char = wezterm.nerdfonts.linux_debian,
    offset = 1,
  },
  almalinux = {
    char = wezterm.nerdfonts.linux_almalinux,
    offset = 1,
  },
  archlinux = {
    char = wezterm.nerdfonts.linux_archlinux,
    offset = 1,
  },
  fedora = {
    char = wezterm.nerdfonts.linux_fedora,
    offset = 1,
  },
  windows = {
    char = wezterm.nerdfonts.dev_powershell,
    offset = 3,
  },
  darwin = {
    char = wezterm.nerdfonts.linux_apple,
    offset = 1,
  },
}

local function get_icon_for_domain(domain_name)
  if domain_name == "local" then
    if wezterm.target_triple == "x86_64-pc-windows-msvc" then
      return domain_icons.windows
    elseif wezterm.target_triple == "x86_64-apple-darwin" then
      return domain_icons.darwin
    elseif wezterm.target_triple == "aarch64-apple-darwin" then
      return domain_icons.darwin
    else
      return {
        char = wezterm.nerdfonts.linux_tux,
        offset = 1,
      }
    end
  end

  for pattern, icon in pairs(domain_icons) do
    if domain_name:lower():find(pattern) ~= nil then
      return icon
    end
  end

  return {
    char = wezterm.nerdfonts.oct_terminal,
    offset = 1,
  }
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
  local pane = tab.active_pane
  local title = pane.title

  if pane.domain_name then
    local icon = get_icon_for_domain(pane.domain_name)
    title = icon.char .. string.rep(" ", 4 - icon.offset) .. title
  end

  return title
end)

return config
