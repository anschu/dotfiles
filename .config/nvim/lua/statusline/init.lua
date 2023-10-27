Statusline = {}

local ft = require('statusline.ft')
local git = require('statusline.git')
local line = require('statusline.line')
local lsp = require('statusline.lsp')

Statusline = function()
  return table.concat({
    git(),
    ' %m %f ',
    lsp(),
    '%=%',
    ft(),
    ' ',
    line(),
  })
end

local ag = vim.api.nvim_create_augroup('Statusline', { clear = true })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function() vim.opt_local.statusline = '%!v:lua.Statusline()' end,
  group = ag,
  pattern = '*',
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  callback = function() vim.opt_local.statusline = '%!v:lua.Statusline()' end,
  group = ag,
  pattern = '*',
})
