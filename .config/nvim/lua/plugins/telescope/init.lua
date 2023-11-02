return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>s'] = { name = 'Search' },
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
      'debugloop/telescope-undo.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'ThePrimeagen/git-worktree.nvim',           opts = {} },
    },
    cmd = 'Telescope',
    keys = function()
      local tb = require('telescope.builtin')
      local fn = require('plugins.telescope.functions')
      local ex = require('telescope').extensions
      return {
        { '<leader>b',       tb.buffers,                   desc = 'Buffers' },
        { '<leader>sr',      tb.oldfiles,                  desc = 'Recent Files' },
        { '<leader>r',       tb.oldfiles,                  desc = 'Recent files' },
        { '<leader><space>', fn.git_files,                 desc = 'Find files' },
        { '<leader>sf',      fn.find_files,                desc = 'Files' },
        { '<leader>sw',      fn.grep_string,               desc = 'Word' },
        { '<leader>sg',      fn.live_grep,                 desc = 'Grep' },
        { '<leader>sh',      tb.help_tags,                 desc = 'Help' },
        { '<leader>sm',      tb.marks,                     desc = 'Marks' },
        { '<leader>/',       tb.current_buffer_fuzzy_find, desc = 'Search in current buffer' },
        { '<leader>sk',      tb.keymaps,                   desc = 'Keymaps' },
        { '<leader>u',       ex.undo.undo,                 desc = 'Undo' },
      }
    end,
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
          previewer = false,
        },
        git_files = {
          theme = "ivy",
          hidden = true,
          previewer = false,
        },
        oldfiles = {
          theme = "ivy",
          cwd_only = true,
          previewer = false,
        }
      },
      extensions = {
        'fzf',
        'git_worktree',
        'undo'
      }
    },
  },
}
