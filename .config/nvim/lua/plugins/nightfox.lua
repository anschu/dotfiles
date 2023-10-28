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
    local colorscheme = vim.fn.system("head -n1 $XDG_CONFIG_HOME/colorscheme | tr -d '\n'")
    if colorscheme then
      vim.cmd.colorscheme(colorscheme)
    else
      vim.cmd.colorscheme('nightfox')
    end
  end,
}
