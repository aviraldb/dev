local M = {}

local builtin = require("telescope.builtin")

-- Vertical split
M.verticalSplit = function ()
    vim.keymap.set("n", "<leader>vs", function()
        builtin.find_files({
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    local action_state = require("telescope.actions.state")
                    local actions = require("telescope.actions")
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    vim.cmd("vsplit " .. selection.path)
                end)
                return true
            end
        })
    end)
end

-- Horizontal split
M.horizontalSplit = function ()
    vim.keymap.set("n", "<leader>hs", function()
        builtin.find_files({
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    local action_state = require("telescope.actions.state")
                    local actions = require("telescope.actions")
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    vim.cmd("split " .. selection.path)
                end)
                return true
            end
        })
    end)
end

return M
