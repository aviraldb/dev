-- Module defination 
local M = {}

function M.conf(config)
    -- Color schemes : 
    config.color_scheme = 'Tokyo Night'
    -- config.color_scheme = 'Catppuccin Mocha'

    config.window_background_opacity = 0.85
    config.enable_tab_bar = false

    config.window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    }
end

-- returning module
return M
