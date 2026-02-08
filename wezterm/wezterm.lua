local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Latte'
config.font = wezterm.font_with_fallback({
    { family = 'Operator Mono', weight = 'Book' },
    'JetBrainsMono Nerd Font',
})
config.font_size = 18.0

-- Tab bar colors (Catppuccin Latte)
config.window_frame = {
    active_titlebar_bg = '#eff1f5',
    inactive_titlebar_bg = '#e6e9ef',
    font = wezterm.font('Operator Mono', { weight = 'Bold' }),
    font_size = 14.0,
}

config.colors = {
    tab_bar = {
        active_tab = {
            bg_color = '#eff1f5',
            fg_color = '#4c4f69',
        },
        inactive_tab = {
            bg_color = '#e6e9ef',
            fg_color = '#9ca0b0',
        },
        inactive_tab_hover = {
            bg_color = '#ccd0da',
            fg_color = '#4c4f69',
        },
        new_tab = {
            bg_color = '#e6e9ef',
            fg_color = '#4c4f69',
        },
        new_tab_hover = {
            bg_color = '#ccd0da',
            fg_color = '#4c4f69',
        },
    },
}

config.keys = {
    { key = 'k', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection('Up') },
    { key = 'j', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection('Down') },
    { key = 'h', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection('Left') },
    { key = 'l', mods = 'SUPER', action = wezterm.action.ActivatePaneDirection('Right') }
}


return config

