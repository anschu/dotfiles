return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'windwp/nvim-ts-autotag', opts = {} },
  },
  build = ':TSUpdate',
  cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
  keys = {
    { '<c-space>', desc = 'Increment selection' },
    { '<bs>',      desc = 'Decrement selection', mode = 'x' },
  },
  opts = {
    ensure_installed = {
      'lua',
      'javascript',
      'typescript',
      'tsx',
      'ron',
      'rust',
      'toml',
      'markdown',
      'markdown_inline',
      'vue',
      'html',
      'css',
      'scss',
      'php',
      'phpdoc',
      'dockerfile',
      'diff',
      'yaml',
      'json',
      'http',
      'sql',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'markdown' },
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = false,
        node_decremental = '<bs>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },
  config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
}
