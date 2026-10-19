--- Options ---

-- Leader Key
vim.g.mapleader = " "

-- Vim Keymaps timeouts
vim.timeoutlen = 400

-- Mouse support
vim.opt.mouse = 'a'

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable exrc support
vim.o.exrc = true

-- Visual Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = false
vim.opt.scrolloff = math.floor(vim.o.lines / 2) - 5
vim.opt.sidescrolloff = math.floor(vim.o.lines / 2) - 5
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:1"

-- Wrapping behavior
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.textwidth = 80     -- formatters
vim.opt.colorcolumn = "+1" -- visual

-- Move by visual lines when wrapped
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- splits
vim.opt.splitbelow = false
vim.opt.splitright = true

-- Best search settings :)
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Wild mode / Command mode
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'

-- Conceal level
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- Tab opts
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Vim UI 2
require("vim._core.ui2").enable()

-- Enable some features
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("nvim.tohtml")
