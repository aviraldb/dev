return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  config = function ()
        require("oil").setup({
        default_file_browser = true,
        columns = {
            "icon",
            "permission",
            -- "name",
            "size",
        },
        view_options = {
                show_hidden = true,
        },
    })
  end,
}
