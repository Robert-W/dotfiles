local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Configure colors and appearance
config.color_scheme = 'Kanagawa (Gogh)'
config.font = wezterm.font('OperatorMono Nerd Font', { weight = 'Book' })
config.font_size = 14.0
config.line_height = 1.1
config.hide_tab_bar_if_only_one_tab = false

config.window_background_opacity = 0.95
config.window_padding = {
  top = '3px',
  right = '3px',
  bottom = '3px',
  left = '3px',
}

return config
