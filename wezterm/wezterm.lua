-- Use wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
--config.macos_window_background_blur = 10
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Font (Nerd Font for icon support)
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12
--config.line_height = 1.2 -- Not applied for a bug, introduces unexpected bottom padding

return config
