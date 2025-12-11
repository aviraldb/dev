-- Better use a json parser for this and generate a json file
-- from matugen or other color generators to automate this
-- process.
-- Color scheme will take precedence over the colors declaration
-- and thus color scheme need to be commented out to make
-- these colors appear in terminal.

-- Module defination 
local M = {}

function M.conf(config)
    config.colors = {
        -- Primary colors
        -- foreground = '',
        -- background = '',

        -- Cursor colors
        -- cursor_bg = '',
        -- cursor_fg = '',
        -- cursor_border = '',

        -- Selection Colors
        -- selection_fg = '',
        -- selection_bg = '',

        -- Compose mode is when leader is waiting for next keypress
        -- compose_color = '',

        -- Copy Mode
        -- copy_mode_active_highlight_bg = '',
        -- copy_mode_active_highlight_fg = '',
    }
end

-- returning Module
return M
