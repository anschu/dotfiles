return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = function()
    local t = require('trouble')
    return {
      { '<leader>cx', function() t.toggle('document_diagnostics') end, desc = 'Diagnostic' },
    }
  end,
  opts = {},
}
