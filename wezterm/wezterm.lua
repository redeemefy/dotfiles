local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'catppuccin-frappe'
config.font = wezterm.font('Operator Mono', { weight = 'Book' })
config.font_size = 18.0


return config

