-- Automatically load colorscheme plugins from lua/colorscheme directory
local function load_colorscheme_specs()
    local colorscheme_dir = vim.fn.stdpath("config") .. "/lua/colorschemes"
    local specs = {}

    -- Load colorscheme specs from directory
    if vim.fn.isdirectory(colorscheme_dir) == 1 then
        local files = vim.fn.readdir(colorscheme_dir)
        for _, file in ipairs(files) do
            if file:match("%.lua$") then
                local module_name = file:gsub("%.lua$", "")
                local ok, spec = pcall(require, "colorschemes." .. module_name)
                if ok and type(spec) == "table" then
                    spec.lazy = false
                    spec.priority = spec.priority or 1000
                    table.insert(specs, spec)
                end
            end
        end
    end

    -- If no colorschemes found, add tokyonight as fallback
    if #specs == 0 then
        table.insert(specs, {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
        })
    end

    return specs
end

return load_colorscheme_specs()
