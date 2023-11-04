return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  keys = {
    { '<leader>od', vim.cmd.DBUIToggle, desc = 'Database UI' },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
