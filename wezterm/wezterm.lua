local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font {
   family = 'Gintronic',
   weight = 'Book',
}

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.warn_about_missing_glyphs = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_bidi = true

config.colors = {
    cursor_bg = '#bcdba0',

    tab_bar = {
        background = '#000000',
        active_tab = {
          bg_color = '#1a1a1a',
          fg_color = '#c0c0c0',
        },

        inactive_tab = {
          bg_color = '#000000',
          fg_color = '#808080',
        },

        inactive_tab_hover = {
          bg_color = '#111111',
          fg_color = '#909090',
        },

        new_tab = {
          bg_color = '#000000',
          fg_color = '#808080',
        },

        new_tab_hover = {
          bg_color = '#111111',
          fg_color = '#909090',
        },
    },
}

config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 0,
}

return config

