-- Pull in the wezterm API
local wezterm = require 'wezterm'
local launch_menu = {}

-- This will hold the configuration.
local config = wezterm.config_builder()


act = wezterm.action


-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 150
config.initial_rows = 36

-- or, changing the font size and color scheme.
config.font = wezterm.font 'Maple Mono NF CN'
config.font_size = 10
config.color_scheme = 'LiquidCarbonTransparent'

config.default_prog = { 'pwsh.exe' }

table.insert(launch_menu, {
  label = 'PowerShell',
  args = { 'powershell.exe', '-NoLogo' },
})

table.insert(launch_menu, {
  label = 'Pwsh7',
  args = { 'pwsh.exe', '-NoLogo' },
})


config.keys = {
  { key = 'l', mods = 'ALT', action = act.ShowLauncher },
}

config.keys = {
  -- paste from the clipboard
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

  -- paste from the primary selection
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

config.enable_tab_bar = true

config.window_decorations = "RESIZE"

config.launch_menu = launch_menu

-- Finally, return the configuration to wezterm:
return config