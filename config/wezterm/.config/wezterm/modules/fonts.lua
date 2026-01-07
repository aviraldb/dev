-- Module defination 
local M = {}
local wezterm = require "wezterm"

function M.conf(config)
    config.font_size = 18
    config.font = wezterm.font({
        family = "JetBrains Mono Nerd Font",
        harfbuzz_features = { "calt=1", "liga=1" },
    })
end

-- returning Module
return M
