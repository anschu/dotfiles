return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    options = {
      styles = {
        comments = 'italic',
      },
    },
  },
  config = function()
    vim.cmd.colorscheme('nightfox')
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
}
