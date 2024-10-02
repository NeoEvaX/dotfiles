-- Pull in wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16
config.freetype_load_flags = "NO_HINTING"
config.window_decorations = "RESIZE"

config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte

-- global variables
Home_background = wezterm.config_dir .. "/HomeBackgrounds/1.jpg"
Normal_background = wezterm.config_dir .. "/Wallpapers/Stormlight.jpg"
Default_background = Normal_background

-- toggle backgrounds with ALT+l
wezterm.on("toggle-background-mode", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.background then
		if overrides.background[1].source.File == Normal_background then
			overrides.background = {
				{
					source = {
						File = Home_background,
					},
				},
				{
					source = {
						Color = "rgba(28, 33, 39, 0.75)",
					},
					height = "100%",
					width = "100%",
				},
			}
			wezterm.log_info("Switching to Home Background")
		else
			overrides.background = {
				{
					source = {
						File = Normal_background,
					},
				},
				{
					source = {
						Color = "rgba(28, 33, 39, 0.75)",
					},
					height = "100%",
					width = "100%",
				},
			}
			wezterm.log_info("Switching to Normal Background")
		end
	else
		overrides.background = {
			{
				source = {
					File = Normal_background,
				},
			},
			{
				source = {
					Color = "rgba(28, 33, 39, 0.75)",
				},
				height = "100%",
				width = "100%",
			},
		}
		wezterm.log_info("Switching to Normal Background")
	end
	window:set_config_overrides(overrides)
end)

config.background = {
	{
		source = {
			File = Default_background,
		},
	},
	{
		source = {
			Color = "rgba(28, 33, 39, 0.75)",
		},
		height = "100%",
		width = "100%",
	},
}
config.keys = {
	{
		key = "b",
		mods = "ALT|SHIFT",
		action = wezterm.action.EmitEvent("toggle-background-mode"),
	},
}
return config
