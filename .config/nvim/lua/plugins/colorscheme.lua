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
      else
        vim.cmd.colorscheme('carbonfox')
      end
    end,
  },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     if vim.o.background == "dark" then
  --       vim.cmd.colorscheme('kanagawa-dragon')
  --     end
  --   end,
  -- }
}
