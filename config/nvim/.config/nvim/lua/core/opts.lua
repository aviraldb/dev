
-- Options / Settings for Neovim 
local opt = vim.opt

-- Tab opts
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")

-- Leader Key
vim.g.mapleader = ' '

-- Visuals
vim.wo.number = true
vim.wo.relativenumber = true

-- splits
opt.splitbelow = true
opt.splitright = true

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true
