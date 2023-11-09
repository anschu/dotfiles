return {
  { 'tpope/vim-sleuth' },
  { 'aserowy/tmux.nvim',            lazy = false,    opts = {} },
  { 'echasnovski/mini.pairs',       version = false, opts = {} },
  { 'echasnovski/mini.surround',    version = false, opts = {} },
  { 'echasnovski/mini.comment',     version = false, opts = {} },
  { 'echasnovski/mini.ai',          version = false, opts = {} },
  { 'echasnovski/mini.cursorword',  version = false, opts = {} },
  { 'echasnovski/mini.indentscope', version = false, opts = {} },
  { 'echasnovski/mini.splitjoin',   version = false, opts = {} },
  { "folke/twilight.nvim",          opts = {} },
  {
    "folke/zen-mode.nvim",
    keys = { {
      '<leader>z',
      function() require("zen-mode").toggle() end,
      desc = "Zen-mode"
    } },
    opts = {}
  },
}
