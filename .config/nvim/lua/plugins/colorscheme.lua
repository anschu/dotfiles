return {
  {
    "EdenEast/nightfox.nvim",
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
      if vim.o.background == "light" then
        vim.cmd.colorscheme('dayfox')
      end
    end,
  },

  {
    "Mofiqul/vscode.nvim",
    opts = {
      style = 'dark'
    },
    config = function()
      if vim.o.background == "dark" then
        vim.cmd.colorscheme('vscode')
      end
    end,
  }
}
