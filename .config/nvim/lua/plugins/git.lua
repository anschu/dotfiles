return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>g'] = { name = 'Git' },
      },
    },
  },

  {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
      { '<leader>gs', '<CMD>Git<CR>',               desc = 'Status' },
      { '<leader>gp', '<CMD>Git pull<CR>',          desc = 'Pull' },
      { '<leader>gP', '<CMD>Git push<CR>',          desc = 'Push' },
      { '<leader>ga', '<CMD>GWrite<CR>',            desc = 'Add' },
      { '<leader>gl', '<CMD>Git log --oneline<CR>', desc = 'Log' },
      { '<leader>gb', '<CMD>Git blame<CR>',         desc = 'Blame' },
      { '<leader>go', '<CMD>GBrowse<CR>',           desc = 'Open in Browser' }
    }
  },

  { 'tpope/vim-rhubarb', lazy = false },

  {
    'ThePrimeagen/git-worktree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = function()
      local t = require('telescope');
      return {
        { '<leader>gw', t.extensions.git_worktree.git_worktrees,       desc = 'Worktrees' },
        { '<leader>gW', t.extensions.git_worktree.create_git_worktree, desc = 'Create worktree' }
      }
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set(
          'n',
          '<leader>gp',
          require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Preview git hunk' }
        )

        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },
}
