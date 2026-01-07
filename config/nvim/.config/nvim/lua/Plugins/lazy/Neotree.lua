
return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    lazy = false,
    config = function ()
        require("neo-tree").setup({
            window = {
                width = 30,
                -- width = function ()
                --     return math.min(40, 0.2 * vim.o.columns)
                -- end,
            },
            file = {
                enabled = true,
                symbols = {
                    ["asm"] = "", -- you can use a CPU/microchip icon if installed in nerdfonts
                }
            }
        })
    end,
}
