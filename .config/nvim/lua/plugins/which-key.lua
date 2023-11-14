return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { 'n', 'v' },
      ['<leader>1'] = 'which_key_ignore',
      ['<leader>2'] = 'which_key_ignore',
      ['<leader>3'] = 'which_key_ignore',
      ['<leader>4'] = 'which_key_ignore',
      ['<leader>5'] = 'which_key_ignore',
      ['<leader>6'] = 'which_key_ignore',
      ['<leader>7'] = 'which_key_ignore',
      ['<leader>8'] = 'which_key_ignore',
      ['<leader>9'] = 'which_key_ignore',
      ['g'] = { name = 'Goto' },
      [']'] = { name = 'Next' },
      ['['] = { name = 'Prev' },
      ['<leader>o'] = { name = 'Tools', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = 'Window', _ = 'which_key_ignore' },
    },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
