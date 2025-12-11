-- lua/colorscheme-picker.lua
-- Require this in your init.lua: require("colorscheme-picker")

local M = {}

-- Path to store the selected colorscheme
local cache_path = vim.fn.stdpath("data") .. "/colorscheme.txt"

-- Load the saved colorscheme
local function load_colorscheme()
    local file = io.open(cache_path, "r")
    if file then
        local colorscheme = file:read("*l")
        file:close()
        return colorscheme
    end
    return "tokyonight" -- Default fallback
end

-- Save the colorscheme to file
local function save_colorscheme(colorscheme)
    local file = io.open(cache_path, "w")
    if file then
        file:write(colorscheme)
        file:close()
    end
end

-- Apply colorscheme
local function apply_colorscheme(colorscheme)
    local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
    if ok then
        save_colorscheme(colorscheme)
        vim.notify("Colorscheme set to: " .. colorscheme, vim.log.levels.INFO)
    else
        vim.notify("Failed to load colorscheme: " .. colorscheme .. ", falling back to tokyonight", vim.log.levels.WARN)
        -- Fallback to tokyonight
        pcall(vim.cmd.colorscheme, "tokyonight")
        save_colorscheme("tokyonight")
    end
end

-- Command to change colorscheme
vim.api.nvim_create_user_command("Colorscheme", function(opts)
    local colorscheme = opts.args
    if colorscheme == "" then
        vim.notify("Current colorscheme: " .. vim.g.colors_name, vim.log.levels.INFO)
        return
    end
    apply_colorscheme(colorscheme)
end, {
    nargs = "?",
    complete = function()
        return vim.fn.getcompletion("", "color")
    end,
})

-- Telescope picker for colorschemes
M.pick_colorscheme = function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local conf = require("telescope.config").values

    local colorschemes = vim.fn.getcompletion("", "color")

    pickers.new({}, {
        prompt_title = "Colorschemes",
        finder = finders.new_table({
            results = colorschemes,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                apply_colorscheme(selection[1])
            end)
            return true
        end,
    }):find()
end

-- Set up keybinding for Telescope picker
vim.keymap.set("n", "<leader>cs", M.pick_colorscheme, { desc = "Choose colorscheme" })

-- Initialize: Load saved colorscheme on startup
M.setup = function()
    vim.schedule(function()
        apply_colorscheme(load_colorscheme())
    end)
end

-- Auto-initialize
M.setup()

return M
