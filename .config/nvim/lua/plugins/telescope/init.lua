return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>s'] = { name = 'Search' },
        ['<leader>c'] = { name = 'Code' },
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
      "nvim-telescope/telescope-file-browser.nvim",
      "benfowler/telescope-luasnip.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'ThePrimeagen/git-worktree.nvim',           opts = {} },
    },
    cmd = 'Telescope',
    keys = function()
      local tb = require('telescope.builtin')
      local fn = require('plugins.telescope.functions')
      local ex = require('telescope').extensions
      return {
        { '<leader>ss',      tb.resume,                    desc = 'Resume' },
        { '<leader>b',       tb.buffers,                   desc = 'Buffers' },
        { '<leader>sr',      tb.oldfiles,                  desc = 'Recent Files' },
        { '<leader>r',       tb.oldfiles,                  desc = 'Recent files' },
        { '<leader>sx',      tb.diagnostics,               desc = 'Diagnostics' },
        { '<leader><space>', fn.project_files,             desc = 'Find files' },
        { '<leader>sf',      fn.find_files,                desc = 'Files' },
        { '<leader>gf',      fn.git_files,                 desc = 'Files' },
        { '<leader>gg',      tb.git_branches,              desc = 'Branches' },
        { '<leader>sw',      fn.grep_string,               desc = 'Word' },
        { '<leader>sg',      fn.live_grep,                 desc = 'Grep' },
        { '<leader>sh',      tb.help_tags,                 desc = 'Help' },
        { '<leader>?',       tb.help_tags,                 desc = 'Help' },
        { '<leader>sm',      tb.marks,                     desc = 'Marks' },
        { '<leader>/',       tb.current_buffer_fuzzy_find, desc = 'Search in current buffer' },
        { '<leader>sk',      tb.keymaps,                   desc = 'Keymaps' },
        { '<leader>u',       ex.undo.undo,                 desc = 'Undo' },
        { '<leader>cs',      tb.lsp_document_symbols,      desc = 'Symbols' },
        { '<leader>cu',      tb.lsp_references,            desc = 'References' },
        { '<leader>gc',      tb.git_commits,               desc = 'Commits' },
        { '<leader>cy',      ex.luasnip.luasnip,           desc = 'Snippets' },
        { '<leader>e',       ex.file_browser.file_browser, desc = 'File browser' },
      }
    end,
    opts = {
      pickers = {
        find_files   = {
          previewer = false,
        },
        git_files    = {
          hidden = true,
          previewer = false,
        },
        oldfiles     = {
          cwd_only = true,
          previewer = false,
        },
        buffers      = {
          initial_mode = "normal",
          previewer = false,
        },
        diagnostics  = {
          initial_mode = "normal",
        },
        marks        = {
          initial_mode = "normal",
        },
        git_commits  = {
          initial_mode = "normal",
        },
        git_branches = {
          initial_mode = "normal",
        }
      },
      extensions = {
        file_browser = {
          initial_mode = "normal",
          theme = "dropdown",
          previewer = false,
        },
        undo = {
          initial_mode = "normal",
        },
        luasnip = {
          initial_mode = "normal",
        },
        'fzf',
        'git_worktree',
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "git_worktree"
      require("telescope").load_extension "undo"
      require("telescope").load_extension "luasnip"
      require("telescope").load_extension "file_browser"
    end,
  },
}
