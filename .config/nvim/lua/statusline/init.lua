Statusline = {}

local ft = require('statusline.ft')
local git = require('statusline.git')
local line = require('statusline.line')
local lsp = require('statusline.lsp')

Statusline.active = function()
  return table.concat({
    git(),
    ' %m',
    '%f ',
    lsp(),
    '%=%',
    ft(),
    line(),
  })
end

Statusline.inactive = function()
  return table.concat({
    ' %m',
    '%f ',
  })
end

local ag = vim.api.nvim_create_augroup('Statusline', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function() vim.opt_local.statusline = '%!v:lua.Statusline.active()' end,
  group = ag,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  callback = function() vim.opt_local.statusline = '%!v:lua.Statusline.inactive()' end,
  group = ag,
  pattern = '*',
})
