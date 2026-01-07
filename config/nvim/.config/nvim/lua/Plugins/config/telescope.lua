local M = {}

M.customPickers = function ()
    -- local pickers = require "telescope.pickers"
    -- local finders = require "telescope.finders"
    -- local conf = require("telescope.config").values
    -- local set = vim.keymap.set
end

M.config = function ()
    require("telescope").setup({
        defaults = {
            -- Customize the prompt for better aesthetics
            prompt_prefix = " > ",
            selection_caret = " ▸ ",

            -- Enable colors and icons
            dynamic_preview_title = true,

            -- Layout configuration
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    mirror = false,
                    preview_width = 0.55,
                },
                vertical = {
                    mirror = false,
                },
            },
        },
    })
end

return M
