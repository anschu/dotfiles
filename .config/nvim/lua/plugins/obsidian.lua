return {
  'epwalsh/obsidian.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = { 'ObsidianWorkspace' },
  event = {
    'BufReadPre ' .. vim.fn.expand('~') .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/**.md',
    'BufNewFile ' .. vim.fn.expand('~') .. '/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/**.md',
  },
  opts = {
    overwrite_mappings = true,
    mappings = {
      ['gf'] = {
        action = function() return require('obsidian').util.gf_passthrough() end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- ['<leader><space>'] = { '<CMD>ObsidianQuickSwitch<CR>', 'Quickswitch' },
    },
    workspaces = {
      {
        name = 'personal',
        path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes',
      },
    },
  },
}
