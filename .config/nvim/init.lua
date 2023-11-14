require('options')
require('autocmd')
require('mappings')
require('statusline')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

vim.api.nvim_create_user_command('ThemeSwitcher',
  function()
    local background = vim.fn.system("head -n1 $XDG_CONFIG_HOME/colorscheme | tr -d '\n'")
    if background then
      vim.o.background = background
    end

    if vim.o.background == "dark" then
      vim.cmd.colorscheme('vscode')
    elseif vim.o.background == "light" then
      vim.cmd.colorscheme('dayfox')
    end
  end,
  {}
)

vim.cmd.ThemeSwitcher()

