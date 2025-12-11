-- Module defination 
local M = {}

function M.conf(config)
    -- Color schemes : 
    config.color_scheme = 'Tokyo Night'
    -- config.color_scheme = 'Catppuccin Mocha'

    config.window_background_opacity = 0.85
    config.enable_tab_bar = false
end

-- returning module
return M
