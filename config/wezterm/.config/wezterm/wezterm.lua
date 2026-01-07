
local config = {}

local list_configs = {
    "colorschemes",
    "appearance",
    "fonts",
    "colors",
}


for _, confs in ipairs(list_configs) do
    require("modules." .. confs).conf(config)
end

return config
