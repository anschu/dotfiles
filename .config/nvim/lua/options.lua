vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.winbar = ' '

vim.g.netrw_liststyle = 3
vim.g.netrw_hide = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_sizestyle = 'H'
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_localmkdir = 'mkdir -p'
vim.g.netrw_localrmdir = 'rm -r'
vim.g.netrw_winsize = 0
vim.g.netrw_preview = 1

local colorscheme = vim.fn.system("head -n1 $XDG_CONFIG_HOME/colorscheme | tr -d '\n'")
if colorscheme then
  vim.o.background = colorscheme
end
