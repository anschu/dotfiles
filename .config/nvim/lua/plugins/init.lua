return {
  { 'tpope/vim-sleuth' },
  { 'aserowy/tmux.nvim',           lazy = false,    opts = {} },
  { 'echasnovski/mini.pairs',      version = false, opts = {} },
  { 'echasnovski/mini.surround',   version = false, opts = {} },
  { 'echasnovski/mini.comment',    version = false, opts = {} },
  { 'echasnovski/mini.ai',         version = false, opts = {} },
  { 'echasnovski/mini.cursorword', version = false, opts = {} },
  {
    'echasnovski/mini.files',
    version = false,
    keys = function()
      return {
        { '<leader>e', function() require('mini.files').open() end, desc = 'File explorer' },
      }
    end,
  },
}
