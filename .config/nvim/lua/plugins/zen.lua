return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>z'] = { name = 'Zen' },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      {
        '<leader>zz',
        function()
          require("zen-mode").toggle({
            window = {
              backdrop = 1
            },
            plugins = {
              options = {
                enabled = true,
                ruler = true,
                showcmd = true,
                laststatus = 3,
              },
              twilight = { enabled = false },
              gitsigns = { enabled = true }
            }
          })
        end,
        desc = "Light"
      },
      {
        '<leader>zf',
        function() require("zen-mode").toggle() end,
        desc = "Full"
      }
    },
    opts = {}
  },
}
