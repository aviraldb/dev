return{
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    transparetn_background = true,
  },
  config = function()
        vim.cmd.colorscheme "catppuccin"
  end
}
