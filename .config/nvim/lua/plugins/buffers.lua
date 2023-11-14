return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>b'] = { name = 'Buffer' },
      },
    },
  },
  {
    'echasnovski/mini.bufremove',
    version = false,
    keys = function()
      local delete = require('mini.bufremove').delete
      return {
        { '<leader>bd', delete, desc = 'Close buffer' },
      }
    end,
    opts = {},
  }
}
