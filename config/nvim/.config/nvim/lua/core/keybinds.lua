
-- Generic KeyBinds :
local set = vim.keymap.set

-- Copy Pasta KeyBinds :
set({'n', 'v'}, 'Y', '"+y', { desc = "Copy to clipboard" })
set({'n', 'v'}, 'P', '"+p', { desc = "Paste from clipboard" })
set({'n', 'v'}, '<C-c>', '"+y', { desc = "Copy to clipboard --Control C" })
set({'n', 'v'}, '<C-p', '"+p', { desc = "Paste from clipboard --Control P" })

-- QoL KeyBinds
set("n", "<leader><leader>r", ":source % <CR>") -- source the entire file

-- Splits 
require("customKeybinds.splits").verticalSplit() -- <leader>vs
require("customKeybinds.splits").horizontalSplit() -- <leader>ss

-- Explorer:
set({'n'}, ',', ":Ex<CR>")
set({'n'}, '<leader>e', ":Oil<CR>")

-- Terminal in Vertical Split
set({'n', 'v'}, '<leader>tt', ":vert term . <CR>")
        -- Close the window if the terminal closes
vim.api.nvim_create_autocmd("TermClose", {
  callback = function()
    vim.cmd("close!")
  end
})

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return k "<CR>"
  end
end, { expr = true })
