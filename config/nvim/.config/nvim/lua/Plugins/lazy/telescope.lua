
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        "nvim-tree/nvim-web-devicons",
    },

    config = function ()
        require ("Plugins.config.telescope").config()
        require ("Plugins.config.telescope").customPickers()
    end
}
