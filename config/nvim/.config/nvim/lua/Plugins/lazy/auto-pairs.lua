return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,

    opts = {
        diable_filetype = {
            "TelescopePromt",
            "snacks_picker_input",
            "neo-tree"
        }
    }
}
