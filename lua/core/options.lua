local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '
g.have_nerd_font = true

opt.mouse = 'a'
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 10