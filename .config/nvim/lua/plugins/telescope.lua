local function is_git_repo()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  return vim.v.shell_error == 0
end

local function get_git_root()
  local dot_git_path = vim.fn.finddir('.git', '.;')
  return vim.fn.fnamemodify(dot_git_path, ':h')
end

local find_files = function(opts)
  if is_git_repo() then opts = { cwd = get_git_root(), hidden = true } end
  require('telescope.builtin').find_files(opts)
end

local git_files = function(opts)
  if is_git_repo() then
    require('telescope.builtin').git_files({ show_untracked = true })
  else
    find_files(opts)
  end
end

local live_grep = function(opts)
  if is_git_repo() then opts = { cwd = get_git_root() } end
  require('telescope.builtin').live_grep(opts)
end

local grep_string = function(opts)
  if is_git_repo() then opts = { cwd = get_git_root() } end
  require('telescope.builtin').grep_string(opts)
end

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
      { 'ThePrimeagen/git-worktree.nvim', opts = {} },
    },
    cmd = 'Telescope',
    keys = function()
      local tb = require('telescope.builtin')
      return {
        { '<leader>b', function() tb.buffers() end, desc = 'Buffers' },
        { '<leader>sr', function() tb.oldfiles({ cwd_only = true }) end, desc = 'Recent Files' },
        { '<leader>r', function() tb.oldfiles({ cwd_only = true }) end, desc = 'Recent files' },
        { '<leader><space>', function() git_files({ hidden = true }) end, desc = 'Find files' },
        { '<leader>sf', function() find_files() end, desc = 'Files' },
        { '<leader>sw', function() grep_string() end, desc = 'Word' },
        { '<leader>sg', function() live_grep() end, desc = 'Grep' },
        { '<leader>sh', function() tb.help_tags() end, desc = 'Help' },
        { '<leader>sm', function() tb.marks() end, desc = 'Marks' },
        {
          '<leader>/',
          function()
            tb.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
              winblend = 10,
              previewer = false,
            }))
          end,
          desc = 'Search in current buffer',
        },
        { '<leader>sk', function() tb.keymaps() end, desc = 'Keymaps' },
        { '<leader>u', function() require('telescope').extensions.undo.undo() end, desc = 'Undo' },
      }
    end,
    config = function()
      local ts = require('telescope')
      ts.load_extension('fzf')
      ts.load_extension('git_worktree')
      ts.load_extension('undo')
    end,
  },
}
