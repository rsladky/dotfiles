local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'pwsh.exe', '-NoLogo' }

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 12.0

config.color_scheme = 'Tokyo Night'
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_padding = { left = 8, right = 8, top = 6, bottom = 6 }

return config
