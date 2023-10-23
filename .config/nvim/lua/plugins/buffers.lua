return {
  'echasnovski/mini.bufremove',
  version = false,
  keys = function()
    local delete = require('mini.bufremove').delete
    return {
      { '<leader>w', delete, desc = 'Close buffer' },
    }
  end,
  opts = {},
}
